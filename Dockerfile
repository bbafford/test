FROM python:3.6-alpine

ENV PACKAGES="\
       
 
    # dumb-init \
    # musl \
    # libc6-compat \
    # linux-headers \
    # build-base \
    bash \
    git \
    ca-certificates \
    # freetype \
    # libgfortran \
    # 
    # libstdc++ \
    # openblas \
    # 
    # libssl1.0 \
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
   # numpy \
   # matplotlib \
   # scipy \
   # scikit-learn \
   # pandas \
   # nltk \
    " 

RUN apk --update add libxml2-dev libxslt-dev libffi-dev gcc musl-dev libgcc openssl-dev curl libstdc++  
RUN apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev  openblas libgfortran  libc6-compat dumb-init musl linux-headers bash git
RUN pip install Pillow
RUN pip install numpy
RUN pip install matplotlib
RUN pip install scipy
RUN pip install scikit-learn
RUN pip install pandas

# RUN apk add --no-cache --virtual build-dependencies python3 \
#    && apk add --virtual build-runtime \
#    build-base python3-dev openblas-dev freetype-dev pkgconfig gfortran \
#    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
#    && python3 -m ensurepip \
#    && rm -r /usr/lib/python*/ensurepip \
#    && pip3 install --upgrade pip setuptools \
#    && ln -sf /usr/bin/python3 /usr/bin/python \
#    && ln -sf pip3 /usr/bin/pip \
#    && rm -r /root/.cache \
#    && pip install --no-cache-dir $PYTHON_PACKAGES \
#    && apk del build-runtime \
#    && apk add --no-cache --virtual build-dependencies $PACKAGES \
#    && rm -rf /var/cache/apk/*

#WORKDIR  /app

#COPY requirements.txt requirements.txt

#RUN pip3 install -r requirements.txt

#COPY . .

CMD ["python3"]
