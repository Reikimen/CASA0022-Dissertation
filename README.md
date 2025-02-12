# **🚀 基于 Docker 的 AI 语音助手 + IoT 控制 + 动作表情展示**

## **📝 项目简介**

本项目旨在让 **低算力设备（ESP32）** 借助 **PC 端(MAC mini m4)的 AI 计算能力**，实现 **语音交互 + 表情显示 + IoT 设备控制**。ESP32 负责 **语音采集、播放 MP3、控制 LCD 显示屏、执行 IoT 指令**，而 PC 端负责 **AI 语言理解（LLaMA）、语音合成（TTS）、语音识别（Whisper）等任务**。项目目标为实现 **低成本、低延迟、智能化、简易部署的语音助手**，可应用于 **智能家居、AI 互动、机器人控制等场景**。



## **🔹 核心功能**

### 1️⃣ **语音交互（双向）**

 ✅ **ESP32 录音**（短语音 PCM/WAV）**→ 发送至 Docker 进行 STT**

 ✅ **Docker 端 AI（LLaMA）生成回复**，并使用 **TTS 生成 MP3**

 ✅ **ESP32 接收流式 MP3 并播放**

### 2️⃣ **表情 & 动作显示（LCD 屏幕）**

 ✅ **Docker 生成表情/动作指令** → **ESP32 解析并播放 GIF**

 ✅ **AI 根据语境选择不同的表情（如微笑、疑问、惊讶）**

### 3️⃣ **IoT 设备控制**（智能家居）

 ✅ **用户语音指令**（如“打开灯”）→ **ESP32 控制灯光、风扇等设备**

 ✅ **ESP32 通过 GPIO / MQTT 远程控制其他 IoT 设备**

### 4️⃣ **双 ESP32 设备协作**

 ✅ **ESP32 #1（音频 & IoT 控制）**

 ✅ **ESP32 #2（LCD 显示表情）**

 ✅ **二者通过 UART/I2C 通信**，实现流畅的语音 + 动作交互



## **🔄 交互流程**

### **📤 1. ESP32 录音并发送至 PC Docker 容器**

- ESP32 **录制 1-3 秒 PCM/WAV 语音**
- 通过 **UDP 发送到 Docker**

### **📥 2. Docker 容器内 处理**

- **Whisper 语音识别（STT）** 转换语音为文本
- **LLaMA 生成 AI 语音回复**
- **TTS（Piper/VITS/EdgeTTS）生成 MP3 语音**
- **分析用户指令，决定是否发送 IoT 控制命令或表情指令**

### **📤 3. Docker 发送数据至 ESP32**

- **流式传输 WAV** → **ESP32 #1 播放**
- **发送 GIF 表情指令** → **ESP32 #2 控制 LCD 显示**
- **发送 IoT 设备指令** → **ESP32 #1 控制智能设备（如开灯）**



## **⚙️ 关键技术**

 🔹 **ESP32 录音 & UDP 传输**（语音输入）

 🔹 **Whisper 语音识别（STT）**（Docker 端）

 🔹 **LLaMA 处理自然语言**（AI 生成对话）

 🔹 **TTS（语音合成，WAV 生成 & 传输）**

 🔹 **ESP32 播放 WAV（I2S DAC 输出）**

 🔹 **LCD 显示表情 GIF（SPI/I2C 控制）**

 🔹 **IoT 设备控制（GPIO / MQTT）**



## **🚀 未来扩展**

 🔸 **优化 STT，支持 Whisper 小模型，降低计算成本**

 🔸 **扩展 WebSocket / MQTT 通信，提高 IoT 设备交互稳定性**

 🔸 **支持 AI 个性化角色**（定制 AI 语气、表情、互动风格）

 🔸 **加入 Edge AI，提升 ESP32 端处理能力（如小型 STT 模型）**



### **项目优势**（Project Advantages）

1. **高性能（High Performance）** - 低算力设备借助 Docker 端强大计算能力，实现 AI 语音交互。

2. **低延迟（Low Latency）** - 采用 UDP 传输，保证实时响应。

3. **可扩展（Scalability）** - 支持新增 AI 模型、更多 IoT 设备和表情动作。

4. **个性化（Personalization）** - 可定制 TTS 语音风格，打造专属 AI 角色。

5. **模块化架构（Modular Architecture）** - AI、TTS、IoT 控制等模块解耦，便于扩展。

6. **跨平台（Cross-Platform）** - 支持 Windows/Linux/Mac，适用于各种计算环境。

7. **智能交互（Smart Interaction）** - AI 结合 GIF 动作和表情，使交互更生动。

8. **多模态支持（Multimodal Support）** - 结合文本、语音、视觉（GIF）增强 AI 体验。

9. **远程控制（Remote Control）** - 可远程操作智能设备（如开关灯）。

10. **边缘计算（Edge Computing）** - 提供本地 AI 推理能力，减少云端依赖。

11. **开源（Open Source）** - 易于修改和贡献，适用于开发者社区。

12. **能耗优化（Energy Efficient）** - 低功耗设备 ESP32 作为终端，减少能耗。

13. **低成本（Cost-Effective）** - 通过 ESP32 和 Docker 方案实现高效 AI 体验。

14. **安全性（Security）** - 设备间通信可加密，提升数据安全。

15. **AI 角色化（AI Characterization）** - AI 具备个性化声音、表情和行为。

16. **智能家居集成（Smart Home Integration）** - 可与现有智能家居系统兼容。

17. **本地化适应（Localization Ready）** - 可支持多种语言和语音风格。

18. **实时 TTS 反馈（Real-Time TTS Feedback）** - 语音响应自然流畅，无卡顿。

19. **极简部署（Easy Deployment）** - 使用 Docker 快速部署，无需复杂环境配置。

20. **未来可扩展性（Future-Proof）** - 可增加 GPT、语音识别、情感计算等功能。

    

## **✨ 总结**

这是一个 **低算力设备（ESP32）通过移动边缘运算调用 AI 计算资源（Docker LLaMA + TTS + STT）** 的智能交互系统。
 ESP32 负责 **录音、播放语音、显示表情、控制 IoT 设备**，Docker 端负责 **AI 语言处理、语音合成、设备管理**。
 最终，实现 **流畅、低延迟、个性化的 AI 语音助手**，可应用于 **智能家居、机器人、语音交互终端等领域**！ 🚀



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