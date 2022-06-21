FROM nvidia/cuda:11.6.0-runtime-ubuntu20.04

RUN apt-get update \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt install python3.9 python3-pip git -y \
    && ln -sf /usr/bin/python3.9 /usr/bin/python

ENV PYTHONUNBUFFERED=1

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

RUN python -m pip install pip --upgrade \
    && python -m pip install poetry \
    && python -m poetry config virtualenvs.create false

COPY . .

RUN python -m poetry install