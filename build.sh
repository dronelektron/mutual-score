#!/bin/bash

PLUGIN_NAME="mutual-score"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
