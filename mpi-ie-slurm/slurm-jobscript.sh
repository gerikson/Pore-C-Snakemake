#!/usr/bin/bash

source /home/$USER/.bashrc
echo $PATH
echo `hostname`
scratch=$(mktemp -p /data/extended/$USER -d -t tmp.XXXXXXXXXXXXXXXX);
export TMPDIR=$scratch;
export TEMP=$scratch;
export TMP=$scratch;
function cleanup {{ rm -rf $TMPDIR; }}
trap cleanup EXIT SIGTERM SIGKILL SIGUSR2
{exec_job}
