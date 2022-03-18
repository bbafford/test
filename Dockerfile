FROM alpine:latest

ENV PACKAGES="\
    zlib-dev \
    jpeg-dev \
    libjpeg-dev \
    zlib1g-dev \
    libjpeg  \
    dumb-init \
    musl \
    libc6-compat \
    linux-headers \
    build-base \
    bash \
    git \
    ca-certificates \
    freetype \
    libgfortran \
    libgcc \
    libstdc++ \
    openblas \
    tcl \
    tk \
    libssl1.0 \
    "

# PYTHON DATA SCIENCE PACKAGES
#   * numpy: support for large, multi-dimensional arrays and matrices
#   * matplotlib: plotting library for Python and its numerical mathematics extension NumPy.
#   * scipy: library used for scientific computing and technical computing
#   * scikit-learn: machine learning library integrates with NumPy and SciPy
#   * pandas: library providing high-performance, easy-to-use data structures and data analysis tools
#   * nltk: suite of libraries and programs for symbolic and statistical natural language processing for English
ENV PYTHON_PACKAGES="\
    pillow \
    numpy \
    matplotlib \
    scipy \
    scikit-learn \
    pandas \
    nltk \
    " 

RUN apk add --no-cache --virtual build-dependencies python3 \
    && apk add --virtual build-runtime \
    build-base python3-dev openblas-dev freetype-dev pkgconfig gfortran \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && ln -sf pip3 /usr/bin/pip \
    && rm -r /root/.cache \
    && pip install --no-cache-dir $PYTHON_PACKAGES \
    && apk del build-runtime \
    && apk add --no-cache --virtual build-dependencies $PACKAGES \
    && rm -rf /var/cache/apk/*

#WORKDIR  /app

#COPY requirements.txt requirements.txt

#RUN pip3 install -r requirements.txt

#COPY . .

CMD ["python3"]
