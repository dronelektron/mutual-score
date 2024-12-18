#!/bin/bash

PLUGIN_NAME="mutual-score"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
