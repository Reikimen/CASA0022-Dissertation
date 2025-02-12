# Docker-Based-Unix-Py-Env-Management
Docker-based protection framework for Linux/Unix (Mac OS) production environments, compatible with Jupyter Notebook and Pandas and other tools. 

# Why not Anaconda although it's quite good？
在学校的教学中，最常被建议的是使用Anaconda配合Jupyter Notebook进行ML或者DL的编写。Anaconda因为其大而全的功能以及多平台支持广受欢迎（并且还有其他种种优势，在此不再赘述），但是：
### Common Issues
Anaconda 在各个平台（不管是Win，MACOS）上安装时，主要的影响是修改环境变量（尤其是 PATH），使得 Anaconda 管理的 Python 和库成为默认的，可能导致与系统自带的 Python 发生冲突。
### Typical Solutions
使用 conda 创建虚拟环境来隔离 Anaconda 环境与系统环境。
### My Comments
虚拟环境确实是一个非常有意思且有效的想法，但是在创建虚拟环境的时候，开发人员往往会耗费相当长的时间。一个熟练的开发者可能只需要3-10分钟，而一个新手开发者会花费半小时到半天的时间。除此之外，配置虚拟环境还需要面对繁琐的包依赖问题（大家普遍采用共享.yml文件方式协作）。我直接望而生畏，并且寻求基于Docker的替代方案。

# 我当前粗浅的想法
## 使用 Docker 搭建 python（DL）环境
我们使用 Docker 搭建深度学习环境的理由有三个：（Copy from https://zhuanlan.zhihu.com/p/626607698）
1.轻量级便捷。使用 VMware 等软件还需要经历一个漫长的“安装操作系统”的过程。使用 Docker 只需要从网上找到合适的镜像下载到本地就好了。
2.便于分享。使用 Docker 建立的镜像很小巧，很适合分享。比如你配置好了一个 PyTorch 的镜像，可以直接拷贝给实验室的其它小伙伴。
3.易于部署。如果你在 Docker 容器中训练好一个模型，并且为它搭建了一个 web 可访问的使用接口。那么你可以把这个容器打包成Docker镜像，直接将这个镜像部署到服务器上，无需在服务器上重复布置软件环境。

## 但这还不够...
如果开发者的电脑上所有小型项目都基于 Docker 搭建，就有可能发生端口冲突的问题。Docker 容器在运行时，可以将容器内部的服务映射到宿主机上的某个端口。
例如，某一个小项目产生的容器 A 中的服务运行在 80 端口，如果将它映射到宿主机的 8080 端口，访问 http://localhost:8080 就可以访问该服务。
如果忘记关闭这个容器，当需要运行另一个小项目的容器 B，且同样需要将容器内部的 80 端口映射到宿主机的 8080 端口时，Docker 会报错，因为同一时间宿主机上的一个端口只能被一个进程占用。也就是说，两个容器尝试使用同一个宿主机端口会导致冲突。

## 如何解决多项目端口冲突
既然端口可能产生冲突，那么为什么不把所有的小项目都放到一整个框架下运行呢。编写某个文件，用于指定编译运行对应的小项目。
使用`which-project`文件来指定某个编译的项目
使用`docker-compose up --build`运行这个框架
使用`docker-compose down`关闭这个框架

> 没k8s的情况下就老老实实docker-compose处理, 编排所有需要的东西.
> 如果你的项目是mono-project +多executable, 看rift的早期版本是怎么处理这个问题的.

以上就是这个基于Docker的对 Linux/Unix(Mac OS) 生产环境（尤其是错综复杂的MAC的Python环境）的保护框架，兼容 Jupyter Notebook 和 Pandas等常用工具。

## 针对简单项目（Branch v1.x.x）

如果每次只跑单个项目，例如我在UCL上课的课堂练习，那么我只有隔离python环境的需求.也就没有必要使用docker-compose进行编排，因此不如直接使用一个project-compiler.sh 文件进行脚本自动化。

### To get start
#### Step 1 - Give project-compiler.sh Permission

    chmod u+x compiler.sh
#### Step 2 - Compile the project u want

    ./compiler.sh project-name

You need to change the "project-name" into the one you want to build/compile which is under the "projects" folders, for instance "project_a"
#### How to Stop (Shut down)
**Method 1:**

      Press "Ctrl+C" for Twice
**Method 2:**

      Press "Ctrl+C" then Enter "y"

# 版本管理(规划)
## Branch v1.x.x
这一个系列，主要针对简单的python项目（小型的机器学习），例如我在UCL CASA的课程学习。每一个“project”实际上对应的是一个特制的放置于docker容器中的python环境，配合Jupyter Notebook能够顺畅地运行。
## Branch v2.x.x
这一个系列，开发目标为：用户选择单个或者多个被编译项目，该项目里可能包含不止一个要被打开的容器，项目内容器同时运行、编译并且相互联通的，能够快速部署的框架。


# 对当前框架的一个客观评价
## 命名问题
事实上，“projects”文件夹下，的每一个“project”在任意的“v1.x.x”中，仅仅是对环境的隔离，所以应该写作“env_a”"env_b"。但是我懒得改了，就这样吧。

然而，抛开我的懒惰不谈，可以看到——在我的思考过程中，以及这个项目的未来规划中，我所计划的是一个长期项目。也就是：在Linux和Unix下，以保护系统环境为主要目的，以Docker为基础，使用docker-compose针对多项目多容器，同时运行、编译并且相互联通的，能够快速部署的一个简易构建系统。

## 杂谈
事实上，使用1-2天的时间（虽然每天也就只是工作4-5小时，还是爱偷懒），更新到“v1.0.1”这个版本。这已经足够cover掉在UCL的，对于DL这门课的学习和研究的python环境管理了。

我的时间相当宝贵，我必须对是否开始开发、何时开发Branch v2.x.x做好详细的规划。