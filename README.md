# Stable Diffusion Web UI Dockerfile

## Usage

To build: 
```bash
docker build . -f Dockerfile.Stable -t sd-web-ui:latest
```

To run: 
```bash
./run.sh
```

## What's included: 
* CUDA 11.7.1
* Torch 2.0.1
* Stable Diffusion Web UI v1.7
* ControlNet
* Xformers 0.0.20

## Link to projects

### Stable Diffusion Web UI
https://github.com/AUTOMATIC1111/stable-diffusion-webui

### Documentation
https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki

### ControlNet
https://github.com/Mikubill/sd-webui-controlnet

### 🐳 Base Docker
https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.7.1/ubuntu2204/devel/cudnn8/Dockerfile <br />
https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/11.7.1/ubuntu2204/base/Dockerfile

### Xformers
https://github.com/facebookresearch/xformers
