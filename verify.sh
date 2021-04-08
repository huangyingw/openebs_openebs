#!/bin/zsh
SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd "$SCRIPTPATH"

sudo cat /etc/iscsi/initiatorname.iscsi
systemctl status iscsid
