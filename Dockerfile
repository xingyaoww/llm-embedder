FROM pytorch/torchserve:0.10.0-gpu

ADD requirements.txt .
RUN pip install -r requirements.txt

ADD scripts/run_torchserve.sh run_torchserve.sh

COPY ./models/model_store models/model_store

CMD ["./run_torchserve.sh"]
