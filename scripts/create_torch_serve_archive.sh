#!/bin/bash

set -x
rm -rf models/model_store
mkdir -p models/model_store

MODEL_NAME=bge-m3
MODEL_PATH=models/bge-m3

torch-model-archiver \
--model-name $MODEL_NAME \
--version 1.0 \
--model-file $MODEL_PATH/pytorch_model.bin \
--handler src/inference/embed_handler.py  \
--extra-files "$MODEL_PATH/config.json,$MODEL_PATH/tokenizer.json,$MODEL_PATH/special_tokens_map.json,$MODEL_PATH/tokenizer_config.json,$MODEL_PATH/sentencepiece.bpe.model" \
--export-path models/model_store

echo "Archive created!"
