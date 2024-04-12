#!/usr/bin/env bash

# Run once to setup kanata as systemd service
# 
# Note this cannot be user service and live in $XDG_CONFIG_HOME/systemd/user
# since kanata needs to run as root.

kanata_bin=${1:-$HOME/.cargo/bin/kanata}
kanata_cfg=${2:-$XDG_CONFIG_HOME/kanata/config.kbd}
kanata_service=${3:-$XDG_CONFIG_HOME/kanata/kanata.service}

cat > ${kanata_service} << EOF
[Unit]
Description=Kanata keyboard remapper
Documentation=https://github.com/jtroo/kanata

[Service]
Type=simple
ExecStart=${kanata_bin} --cfg ${kanata_cfg}
Restart=no

[Install]
WantedBy=multi-user.target
EOF

systemctl enable ${kanata_service}
systemctl start $(basename ${kanata_service})

