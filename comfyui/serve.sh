#!/bin/bash

exec python /opt/ml/code/main.py \
     --listen 0.0.0.0 --port 8080 \
     --output-directory /opt/ml/code/output/ $EXTRA_CMD_ARG
