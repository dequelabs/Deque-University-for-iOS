#!/bin/sh

# Remove Attest Framework only during Clean command
if [ "$ACTION" != "clean" ]; then
    exit 0
elif [ -d "./Framework" ]; then
    rm -rf Framework
fi
