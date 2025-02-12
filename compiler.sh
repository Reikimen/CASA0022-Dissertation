#!/bin/bash

# 1. 传入子项目名称
PROJECT=$1
if [[ -z "$PROJECT" ]]; then
  echo "Usage: ./compiler.sh <project_name>"
  exit 1
fi

# 2. 检查子项目是否存在
PROJECT_DIR="projects/$PROJECT"
if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Error: Project '$PROJECT' does not exist."
  exit 1
fi

# 3. 构建子项目镜像
cd $PROJECT_DIR || exit
docker build --build-arg PROJECT_NAME=$PROJECT -t ${PROJECT}_env .

# 4. 运行子项目容器并映射 Jupyter Notebook
docker run -it --rm --init \
    --name ${PROJECT}_Container \
    -v $(pwd):/workspace/$PROJECT \
    -p 8888:8888 \
    ${PROJECT}_env
