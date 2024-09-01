#!/bin/bash

if [ "$API_ONLY" = "true" ]; then
    NOWEBUI="--nowebui"
fi

if [ ! -z "$CONFIG_FILE" ]; then
    cp -f $CONFIG_FILE /opt/ml/code/config.json
fi

if [ ! "$DYNAMIC_SD_MODEL" = "true" ]; then
    MODEL="--ckpt /opt/ml/code/models/Stable-diffusion/$SD_MODEL_CHECKPOINT"
else
    MODEL="--skip-load-model-at-start"
fi


ACCELERATE=true exec python ./launch.py -f \
    $SETTINGS --api --api-log $NOWEBUI --no-gradio-queue \
    --skip-prepare-environment --no-hashing \
    --no-download-sd-model \
    --loglevel $LOGLEVEL --log-startup \
    --listen --port $PORT --xformers \
    $MODEL $EXTRA_CMD_ARG
