FROM nvidia/cuda:12.3.2-runtime-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y python-is-python3 python3-pip python3.10-dev git wget && \
    rm -rf /var/lib/apt/lists/*

# Create and switch to a new user
RUN adduser --disabled-password --gecos '' -u 1000 user
RUN mkdir -p /opt/ml/code  && chown -R user:user /opt/ml/code
WORKDIR /opt/ml/code
USER user

RUN pip3 install --upgrade pip
RUN pip install torch==2.2.0 torchvision==0.17.0 torchaudio==2.2.0 xformers==0.0.24 --index-url https://download.pytorch.org/whl/cu121

# Clone ComfyUI
RUN git clone --depth 1 https://github.com/comfyanonymous/ComfyUI /opt/ml/code/ && \
    pip install -r requirements.txt

# Hack to disable mmap
RUN sed -i 's/sd = safetensors.torch.load_file(ckpt, device=device.type)/sd = safetensors.torch.load(open(ckpt, '"'rb'"').read())/g' /opt/ml/code/comfy/utils.py

# Clone ComfyUI-Manager and install its requirements
RUN mkdir -p custom_nodes/ComfyUI-Manager && \
    git clone --depth 1 https://github.com/ltdrdata/ComfyUI-Manager /opt/ml/code/custom_nodes/ComfyUI-Manager && \
    pip install -r custom_nodes/ComfyUI-Manager/requirements.txt

# Copy the configuration file
COPY extra_model_paths.yaml serve.sh /opt/ml/code/

EXPOSE 8080
ENV EXTRA_CMD_ARG=""

ENTRYPOINT ["/bin/bash"]
CMD ["/opt/ml/code/serve.sh"]
