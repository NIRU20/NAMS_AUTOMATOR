#!/bin/bash
find /sys/class/net -follow -maxdepth 2 -name wireless | cut -d  -f 5
