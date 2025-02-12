# 使用基础镜像（你可以选择 PyTorch、TensorFlow 或其他适合深度学习的镜像）
FROM python:3.9-slim

# 设置工作目录
ARG PROJECT_NAME
WORKDIR /workspace/${PROJECT_NAME}

# 安装系统依赖
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖（从 requirements.txt）
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目文件到容器中
COPY . .

# 信任项目文件夹内的所有 Jupyter Notebook 文件
RUN find . -name "*.ipynb" -exec jupyter trust {} \;

# 暴露 Jupyter Notebook 的默认端口
EXPOSE 8888

# 启动 Jupyter Notebook 服务
# CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
# 设置 ENTRYPOINT 以便正确处理 SIGTERM 信号
ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]