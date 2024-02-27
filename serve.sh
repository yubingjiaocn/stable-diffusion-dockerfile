#!/bin/bash

if [ "$API_ONLY" = "true" ]; then
    NOWEBUI="--nowebui"
fi

if [ ! -z "$CONFIG_FILE" ]; then
    SETTINGS="--ui-settings-file $CONFIG_FILE"
fi

if [ "$DYNAMIC_SD_MODEL" = "true" ]; then
    DYNAMIC="--ui-debug-mode"
fi

folderArray=(stable-diffusion controlnet lora vae embeddings Codeformer GFPGAN ESRGAN BSRGAN RealESRGAN ScuNET SwinIR LDSR CLIP)
for Name in ${folderArray[*]}
do
  mkdir -p /tmp/models/$Name
done

ACCELERATE=true exec python ./launch.py -f \
    $SETTINGS --api --api-log $NOWEBUI --no-gradio-queue \
    --skip-prepare-environment --no-hashing \
    --no-download-sd-model $DYNAMIC \
    --loglevel $LOGLEVEL --log-startup \
    --listen --port $PORT --xformers \
    --ckpt /tmp/models/stable-diffusion/$SD_MODEL_CHECKPOINT \
    --ckpt-dir /tmp/models/stable-diffusion \
    --controlnet-dir /tmp/models/controlnet \
    --lora-dir /tmp/models/lora \
    --vae-dir /tmp/models/vae \
    --embeddings-dir /tmp/models/embeddings \
    --codeformer-models-path /tmp/models/Codeformer \
    --gfpgan-models-path /tmp/models/GFPGAN \
    --esrgan-models-path /tmp/models/ESRGAN \
    --bsrgan-models-path /tmp/models/BSRGAN \
    --realesrgan-models-path /tmp/models/RealESRGAN \
    --scunet-models-path /tmp/models/ScuNET \
    --swinir-models-path /tmp/models/SwinIR \
    --ldsr-models-path /tmp/models/LDSR \
    --clip-models-path /tmp/models/CLIP $EXTRA_CMD_ARG
