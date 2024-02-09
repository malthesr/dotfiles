#!/usr/bin/env bash

# Helper script to pass text from stdin to a dedicated tmux REPL pane.

set -o pipefail

repl_lang_key=TMUX_REPL
repl_lang=${1:-$(tmux show-environment $repl_lang_key | sed "s:^.*=::")}
buffer="${2:-__repl__}"

# Process names of shells eligible for opening a REPL
shells=(bash zsh fish)

# REPL language config.
#
# repl_cmd: The startup command to use
# repl_proc: The process name to use when checking whether REPL is running
# repl_needs_enter: Whether to append line-end when sending text to repl
case $repl_lang in
  jl | julia)
    repl_cmd="julia --banner=no --threads 4"
    repl_proc="julia"
    repl_needs_enter=false
    ;;

  py | python)
    repl_cmd="python3 -q"
    repl_proc="python3"
    repl_needs_enter=false
    ;;

  r | R)
    repl_cmd="R --quiet --no-save"
    repl_proc="R"
    repl_needs_enter=true
    ;;

  *)
    echo "Usage: 'repl.sh [julia/python/r]'" && exit 1
    ;;
esac

window_id=$(tmux list-panes -F '#{window_id}' | uniq)
repl_env_key="__repl__${window_id}"

repl_pane_id=$(tmux show-environment ${repl_env_key} | sed "s:^.*=::")
repl_env_key_set=$?

tmux has-session -t ${repl_pane_id} 2> /dev/null
repl_pane_exists=$?

if [ ${repl_env_key_set} -eq 0 ] && [ ${repl_pane_exists} -eq 0 ]; then
  # REPL pane exists; check that REPL is still running, or reopen if not
  repl_tty=$(tmux lsp -F '#{pane_id} #{pane_tty}' \
    | awk -v id=${repl_pane_id} '$1==id {print $2}')
  repl_pane_proc=$(ps -o comm= -t ${repl_tty} | tail -1)
  if [ "${repl_pane_proc}" != "${repl_proc}" ]; then
    is_shell=false
    for shell in "${shells[@]}"; do
      if [ "${repl_pane_proc}" == "${shell}" ]; then
        is_shell=true
        tmux send-keys -t ${repl_pane_id} "${repl_cmd}" Enter
      fi
    done
    if [ "${is_shell}" = false ]; then
      echo "Error: Not in shell, cannot reopen REPL" && exit 1
    fi
  fi
else
  # REPL pane does not exist, create and open REPL
  repl_pane_id=$(tmux split-window -h -P -F "#{pane_id}")
  tmux set-environment ${repl_env_key} ${repl_pane_id}
  sleep 0.5 # https://github.com/tmux/tmux/issues/1778
  tmux send-keys -t ${repl_pane_id} "${repl_cmd}" Enter
  tmux last-pane
fi

tmux load-buffer -b ${buffer} -
tmux paste-buffer -d -p -r -b ${buffer} -t ${repl_pane_id}
if [ "${repl_needs_enter}" = true ]; then
  tmux send-keys -t ${repl_pane_id} Enter
fi
