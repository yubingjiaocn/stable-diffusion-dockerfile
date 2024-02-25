#!/bin/bash

if [ "$API_ONLY" = "true" ]; then
    $NOWEBUI="--nowebui"
fi

if [ ! -z "$CONFIG_FILE" ]; then
    $SETTINGS="--ui-settings-file $CONFIG_FILE"
fi

ACCELERATE=true exec python ./launch.py -f \
    $SETTINGS --api $NOWEBUI --no-gradio-queue \
    --skip-prepare-environment --no-hashing \
    --no-download-sd-model \
    --listen --port $PORT --xformers \
    --ckpt /tmp/models/stable-diffusion/$SD_MODEL_CHECKPOINT \
    --ckpt-dir /tmp/models/stable-diffusion \
    --controlnet-dir /tmp/models/controlnet \
    --lora-dir /tmp/models/lora \
    --vae-dir /tmp/models/vae \
    --embeddings-dir /tmp/models/embeddings $EXTRA_CMD_ARG