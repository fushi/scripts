#!/usr/bin/env bash
killall -9 gpg-agent
gpg-agent --daemon &