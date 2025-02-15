# 使用支持C++编译和ARM架构的镜像
# 使用专为ARM优化的基础镜像
FROM arm64v8/python:3.11-bookworm

# 设置工作目录
ARG PROJECT_NAME
WORKDIR /workspace/${PROJECT_NAME}

# 安装系统依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    wget \
    curl \
    clang \
    libgfortran5 \
    libobjc4 \
    libomp-dev \
    libopenblas-dev \
    libssl-dev \
    gfortran \
    pkg-config \
    ninja-build \
    && rm -rf /var/lib/apt/lists/*

# 配置编译环境变量
ENV CC=clang
ENV CXX=clang++
ENV LLAMA_OPENBLAS=ON

# 复制项目文件到容器中
COPY . .

# 安装 Python 依赖（从 requirements.txt）
RUN pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt

# 删除旧目录下拉和编译llama.cpp
RUN rm -rf llama.cpp && \
    git clone https://github.com/ggerganov/llama.cpp && \
    cd llama.cpp && \
    mkdir build && \
    cd build && \
    cmake .. \
        -DLLAMA_BLAS=ON \
        -DLLAMA_OPENBLAS=ON \
        -DBLAS_LIBRARIES=/usr/lib/aarch64-linux-gnu/openblas-pthread/ \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="-march=armv8.2-a+dotprod -mcpu=native" \
        -DCMAKE_CXX_FLAGS="-march=armv8.2-a+dotprod -mcpu=native" \
        -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)

# 选用Jupyter Notebook作为交互式环境
# 信任项目文件夹内的所有 Jupyter Notebook 文件，暴露 Jupyter Notebook 的默认端口
RUN find . -name "*.ipynb" -exec jupyter trust {} \;
EXPOSE 8888
# 启动 Jupyter Notebook 服务，设置 ENTRYPOINT 以便正确处理 SIGTERM 信号
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]