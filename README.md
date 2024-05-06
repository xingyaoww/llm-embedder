# LLM Embedder Deployment & Evaluation

## Environment Setup

Install Miniconda or [Miniforge (mamba)](https://github.com/conda-forge/miniforge?tab=readme-ov-file#unix-like-platforms-mac-os--linux).

```bash
mamba create -n embedder python=3.11 
mamba activate embedder
mamba install torchserve torch-model-archiver torch-workflow-archiver -c pytorch
pip3 install torch torchvision torchaudio
```

## Download models

```bash
mkdir models
cd models
# Example: download baai/bge-m3
git lfs install
git clone https://huggingface.co/BAAI/bge-m3
# model will be saved to models/bge-m3
```

## Convert model to TorchScript

```bash
scripts/create_torch_serve_archive.sh
```

## Build the docker Image

```bash
docker build -t ghcr.io/xingyaoww/torchserve-embedder:0.10.0-gpu-bge-m3 .
```

## Serve the converted model

```bash
# If only want to expose 
docker run -it --rm --gpus '"device=0"' ghcr.io/xingyaoww/torchserve-embedder:0.10.0-gpu-bge-m3
```
