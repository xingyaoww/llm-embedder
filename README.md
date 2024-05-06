# LLM Embedder Deployment & Evaluation

## Deployment

### Environment Setup (Optional)

This is optional, and only needed if you want to download your own model and convert it to `TorchScript` format. If you just want to use existing model I already converted, check [this section](#serve-the-converted-model).


Install Miniconda or [Miniforge (mamba)](https://github.com/conda-forge/miniforge?tab=readme-ov-file#unix-like-platforms-mac-os--linux).

```bash
mamba create -n embedder python=3.11 
mamba activate embedder
mamba install torchserve torch-model-archiver torch-workflow-archiver -c pytorch
pip3 install torch torchvision torchaudio
```

### Download huggingface models

You can replace bge-m3 with any huggingface model you want to use. You should also modify `src/inference/embed_handler.py` to adapt the particular model you are hosting.

```bash
mkdir models
cd models
# Example: download baai/bge-m3
git lfs install
git clone https://huggingface.co/BAAI/bge-m3
# model will be saved to models/bge-m3
```

### Convert model to TorchScript

This script will convert the Pytorch model you downloaded at `models/bge-m3` into a `TorchScript` format for serving.

```bash
scripts/create_torch_serve_archive.sh
```

### Build the docker image

This will pack the `TorchScript` model into a docker image.

```bash
docker build -t ghcr.io/xingyaoww/torchserve-embedder:0.10.0-gpu-bge-m3 .
```

If you just want to use `bge-m3` and don't want to manually build it, you can download the image i've built:

```bash
docker pull ghcr.io/xingyaoww/torchserve-embedder:0.10.0-gpu-bge-m3
```

### Serve the converted model

```bash
# If only want to expose GPU 0
docker run -it --rm --gpus '"device=0"' -p 8080:8080 ghcr.io/xingyaoww/torchserve-embedder:0.10.0-gpu-bge-m3
```

### Inference

You can get the embedding of any sentence by sending over RESTful request.

```bash
curl --location 'http://127.0.0.1:8080/predictions/model' \
--header 'Content-Type: application/json' \
--data '{
    "input": ["how are you?", "who are you?"]
}'
```

If you see something like the followings, it means your embedding deployment is successful!

```
[
  [
    -0.004832866135984659,
    0.027840038761496544,
    -0.04115190729498863,
    -0.038011349737644196,
    0.00468627642840147,
    -0.07148568332195282,
    0.024210147559642792,
    -0.0008565349853597581,
    0.027191104367375374,
    -0.002336308127269149,
    -0.01824376732110977,
    0.029580133035779,
    ...
  ],
  [
    ...
  ]
]
```

## Vector Database

Start qdrant instance.

```bash
docker pull qdrant/qdrant

mkdir -p data/qdrant/data
mkdir -p data/qdrant/snapshots
docker run -p 6333:6333 \
    -v $(pwd)/data/qdrant/data:/qdrant/storage \
    -v $(pwd)/data/qdrant/snapshots:/qdrant/snapshots \
    qdrant/qdrant
```

Access qdrant instance in Python:

```bash
pip install qdrant-client
```

Check `scripts/notebooks/encode_large_scale_data.ipynb` for an example of how to encode large-scale dataset into qdrant for query and evaluation.
