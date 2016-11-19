FROM python:3.4

RUN apt-get update && apt-get install -y \
		libblas-dev \
		liblapack-dev\
    	libatlas-base-dev \
		gfortran \
        python3-pip \
        tk-dev \
        python-tk \
        python3-tk \
        python3-matplotlib \
        pkg-config \
        libfreetype6-dev \
        rsync wget curl zip git zsh vim tmux \
		&& \

    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -O ~/.zshrc http://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
COPY fancy_vundle_install.sh /

RUN pip install -U distribute \
        setuptools \
        pip

RUN pip --no-cache-dir install \
       	ipykernel \
        jupyter \
        numpy \
        matplotlib \
        scipy \
        scikit-image \
        scikit-learn \
        && \
    python3 -m ipykernel.kernelspec

COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
# https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

ENV TENSORFLOW_VERSION 0.11.0rc1

RUN pip --no-cache-dir install \
        https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.11.0rc1-cp34-cp34m-linux_x86_64.whl

# Something Jupyter suggests to do:
# http://jupyter-notebook.readthedocs.io/en/latest/public_server.html#docker-cmd
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]


# tensorboard
EXPOSE 6006

# jupyter
EXPOSE 8888
EXPOSE 8889

WORKDIR "/notebooks"

CMD ["/bin/bash"]
