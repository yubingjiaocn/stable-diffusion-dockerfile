docker run --gpus all -it \
-v /home/ubuntu/models-s3/:/opt/ml/code/models \
-p:8000:8080 comfyui:20240313
