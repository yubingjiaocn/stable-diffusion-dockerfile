docker run --gpus all -it \
-v /home/ubuntu/models/sd:/opt/ml/code/models \
-e DYNAMIC_SD_MODEL="true" \
-p:8000:8080 public.ecr.aws/bingjiao/sd-on-eks/sdwebui:latest

# -e SD_MODEL_CHECKPOINT="AnythingXL_inkBase.safetensors" \