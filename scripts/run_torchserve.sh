#!/bin/bash

echo "server is starting..."
torchserve --foreground \
    --model-store models/model_store \
    --models model=bge-m3.mar --ncs
