#!/bin/bash

if [ "API_ONLY" = "true" ]; then
    $NOWEBUI="--nowebui"
fi

ACCELERATE=true exec python ./launch.py -f
    --api $NOWEBUI --no-gradio-queue \
    --skip-prepare-environment --no-hashing \
    --no-download-sd-model \
    --listen --port $PORT --xformers \
    --ckpt /tmp/models/stable-diffusion/$SD_MODEL_CHECKPOINT \
    --ckpt-dir /tmp/models/stable-diffusion \
    --controlnet-dir /tmp/models/controlnet \
    --lora-dir /tmp/models/lora \
    --vae-dir /tmp/models/vae \
    --embeddings-dir /tmp/models/embeddings $EXTRA_CMD_ARG