docker run --gpus all -it \
-v /home/ubuntu/models:/opt/ml/code/models \
-v /home/ubuntu/models/animatediff-model:/opt/ml/code/extensions/sd-webui-animatediff/model/ \
-e SD_MODEL_CHECKPOINT="v1-5-pruned-emaonly.safetensors" \
-p:8000:8080 sd-web-ui:v1.8.0-20240312
