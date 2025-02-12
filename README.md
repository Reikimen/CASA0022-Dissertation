# Docker-Based-Unix-Py-Env-Management
Docker-based protection framework for Linux/Unix (Mac OS) production environments, compatible with Jupyter Notebook and Pandas and other tools. 

# Why not Anaconda although it's quite good？
Anaconda with Jupyter Notebook is most often recommended tool for ML or DL especially in schools.Anaconda is popular because of its broad functionality and multi-platform support (and has a variety of other advantages that I shall not go into here), but:
### Common Issues
The primary effect of Anaconda installations on various platforms (whether Win, MACOS) is to modify environment variables (especially PATH) to make the Python and libraries managed by Anaconda the defaults, which can lead to conflicts with the Python that comes with the system.
### Typical Solutions
Use conda to create a virtual environment to isolate the Anaconda environment from the system environment.
### My Comments
Virtual environments are indeed a very interesting and usefull idea, but when it comes to creating them, developers tend to spend a considerable amount of time. A proficient developer may take only 3-10 minutes, while a new developer will spend half an hour to even half a day. On top of that, configuring virtual environments involves dealing with cumbersome package dependencies (it's common for people to collaborate by sharing .yml files). 

I was outright daunted and sought a Docker-based alternative.

# My Current Rough Ideas
## Building a python (DL) environment with Docker
There are three reasons why we use Docker to build deep learning environments: (Copied and Translated from https://zhuanlan.zhihu.com/p/626607698)
1. Lightweight and easy. With software like VMware, you have to go through a long process of ‘installing the operating system’. With Docker, all you need to do is find a suitable image on the Internet and download it locally.
2. Easy to share. Images built with Docker are small and easy to share. For example, if you have configured a PyTorch image, you can copy it directly to your lab mates.
3. Easy to deploy. If you train a model in a Docker container and build a web-accessible interface for it, you can package the container as a PyTorch image. Then you can package the container into a Docker image, directly deploy the image to the server, without having to repeat the software environment on the server.

## But that's not enough...
If all the projects on a developer's computer are built based on Docker, there is a possibility of port conflicts.Docker containers can map services inside the container to a port on the host machine when they are running.
For example, if a small project produces a service in container A that runs on port 80, if you map it to port 8080 on the host, you can access the service by going to http://localhost:8080.
If you forget to shut down this container, when you need to run another small project's container B, and you also need to map the container's internal port 80 to the host's port 8080, Docker will report an error because a port on the host can only be occupied by one process at a time. This means that two containers trying to use the same host port will cause a conflict.

## How to resolve multi-project port conflicts
Since ports can conflict, why not run all the small projects under a whole framework. Write a file that specifies which small projects to compile and run.
Use the `which-project` file to specify a compiled project.
Use `docker-compose up --build` to run the framework.
Use `docker-compose down` to shut down the framework.

> If you don't have k8s, just do the old docker-compose thing, and compile everything you need.
> If your project is mono-project + multi-executable, see how earlier versions of rift handled this.

Above is this Docker-based protection framework for Linux/Unix (Mac OS) production environments (especially Python environments on the intricate MAC), compatible with popular tools such as Jupyter Notebook and Pandas.

## For simple usages (Branch v1.x.x)

If I were to run a single project at a time, such as a class exercise for a class I'm attending at UCL, then I'd only have the need to isolate the python environment. There would also be no need to use docker-compose for orchestration, so it would be better to just use a project-compiler.sh file for script automation.

### To get start
#### Step 0

    get a Docker on your device
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

# Version management (planning)
## Branch v1.x.x
This series focuses on simple python projects, such as my coursework at UCL CASA for DL. Each ‘project’ actually corresponds to a purpose-built python environment in a docker container, which runs smoothly with Jupyter Notebook.
## Branch v2.x.x
This series was developed with the goal of developing a rapidly deployable framework for users to select single or multiple compiled projects, which may contain more than one container to be opened, and for project containers to be run, compiled, and interconnected at the same time.


# An objective evaluation of the current framework
## Naming issues
In fact, each ‘project’ in the ‘projects’ folder, in the arbitrary ‘v1.x.x’, is just an isolation of the environment, so it should be written ‘env_a’ and ‘env_b’. should be written as ‘env_a’ and ‘env_b’. But I'm too lazy to change it, so that's it.

However, my laziness aside, it is evident that - in my thought process and in the future planning of this project - I am planning a long-term project. That is: a simple build system that can be rapidly deployed under Linux and Unix, with the main purpose of protecting the system environment, based on Docker, and using docker-compose for multi-projects and multi-containers, running at the same time, compiling, and interconnecting with each other.

## PS
In fact, it took 1-2 days to update to version ‘v1.0.1’ (although I was only working 4-5 hours a day - lazy, also feeling lonely all the time cause my long-distance relationship). This is more than enough to manage the python environment at UCL for the DL course and research.

My time is precious, and I have to plan in detail if and when I will start developing Branch v2.x.x. I'm not sure if I'm going to be able to do that, but I'm going to have to do it.