# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ghcr.io/ucsd-ets/scipy-ml-notebook:2023.4-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

# 3) install packages using notebook user
USER jovyan

# RUN conda install -y scikit-learn

RUN pip install --no-cache-dir networkx scipy && \
    pip install --no-cache-dir os    && \
    pip install --no-cache-dir numpy && \
    pip install --no-cache-dir cv2   && \
    pip install --no-cache-dir matplotlib && \
    pip install --no-cache-dir torch && \
    pip install --no-cache-dir segmentation_models_pytorch && \
    pip install --no-cache-dir multiprocessing

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
