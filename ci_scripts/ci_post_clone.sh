#!/bin/sh
set -e
# Force distribution signing
defaults write com.apple.dt.Xcode IDECodeSigningStyle Manual
