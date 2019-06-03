#!/bin/bash

for f in $(find . ! -name install.sh ! -path "./.git/*" -type f); do
    ln -ivs $(readlink -f $f) $HOME/$f
done
