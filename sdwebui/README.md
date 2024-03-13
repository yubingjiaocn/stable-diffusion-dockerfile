# Stable Diffusion Web UI Dockerfile

## Usage

To build:
```bash
docker build . -f Dockerfile.v1-7 -t sd-web-ui:v1-7
docker build . -f Dockerfile.v1-8 -t sd-web-ui:v1-8
```

To run:
```bash
./run.sh
```

## What's included:

### `Dockerfile.v1-7`

* CUDA 11.7.1
* Torch 2.0.1
* Stable Diffusion Web UI v1.7
* ControlNet
* Xformers 0.0.20

### `Dockerfile.v1-8`

* CUDA 11.8.0
* Torch 2.1.2
* Stable Diffusion Web UI v1.8
* ControlNet
* Xformers 0.0.23.post1

## Mount external model folders

* For v1.7: Put model to corresponding folder on `/tmp/models`
* For v1.8: Put model to corresponding folder on `/opt/ml/code/models`

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
