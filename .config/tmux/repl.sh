#!/usr/bin/env bash

# Helper script to pass text from stdin to a dedicated tmux REPL pane.

set -o pipefail

language=$1
buffer="${2:-__repl__}"
shell="${3:-fish}"

case $language in
  "julia")
    repl_cmd="jl"
    repl_proc="julia"
    ;;

  "python")
    repl_cmd="py"
    repl_proc="python3"
    ;;

  "r")
    repl_cmd="R"
    repl_proc="R"
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
    if [ "${repl_pane_proc}" == "${shell}" ]; then
      tmux select-pane -t ${repl_pane_id}
      tmux send-keys -t ${repl_pane_id} "${repl_cmd}" Enter
    else
      echo "Error: Not in shell, cannot reopen REPL" && exit 1
    fi
  fi
else
  # REPL pane does not exist, create and open REPL
  repl_pane_id=$(tmux split-window -h -P -F "#{pane_id}")
  tmux set-environment ${repl_env_key} ${repl_pane_id}
  tmux send-keys -t ${repl_pane_id} "${repl_cmd}" Enter
  tmux last-pane
fi

tmux load-buffer -b ${buffer} -
tmux paste-buffer -d -p -r -b ${buffer} -t ${repl_pane_id}
tmux send-keys -t ${repl_pane_id} Enter
