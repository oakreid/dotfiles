#!/usr/bin/env bash

killall -q polybar

polybar doom 2>/tmp/doom.log &
