## Notes-EN

### Permission in Linux(Unix)
On Linux systems, the command that gives execution permissions to .sh files is chmod.

Using the chmod command, you can modify file permissions, including read, write, and execute permissions.

The following are the commands to give permission to the .sh file: There are also other options that can be used to give execution permissions to different user groups:

1. Grant execute privileges to the owner, user groups and other users：
   chmod +x filename.sh

2. Give execute privileges to the owner, but not to other users：
   chmod u+x filename.sh

3. Give execution privileges to the user group to which you belong, but not to other users：
   chmod g+x filename.sh

4. Give execute privileges to other users, but not to the owner or to the user group to which they belong.：
   chmod o+x filename.sh

In addition to granting execute permission to .sh files, you can also use the above command to grant execute permission to other file types, such as binary executables, batch files, and so on.

Please note that the user who grants execute permission needs to have sufficient privileges, otherwise the file's permissions will not be modified.

### Check the python and rely version

List all running Docker containers

      docker ps

Entering a specific Docker container

      docker exec -it ${PROJECT}_Container /bin/bash

Querying the container for installed Python packages and their versions

      pip list


## Notes-CN

### Permission in Linux(Unix)
在Linux系统中，给.sh文件赋予执行权限的命令是chmod。

使用chmod命令可以修改文件的权限，包括读取、写入和执行权限。

以下是给.sh文件赋予执行权限的命令。另外，还可以使用其他选项来赋予不同用户组的执行权限：

1. 给所有者、所属用户组和其他用户赋予执行权限：
   chmod +x filename.sh

2. 给所有者赋予执行权限，而其他用户不赋予执行权限：
   chmod u+x filename.sh

3. 给所属用户组赋予执行权限，而其他用户不赋予执行权限：
   chmod g+x filename.sh

4. 给其他用户赋予执行权限，而所有者和所属用户组不赋予执行权限：
   chmod o+x filename.sh

除了给.sh文件赋予执行权限，还可以使用以上命令给其他文件类型赋予执行权限，例如二进制可执行文件、批处理文件等。

请注意，赋予执行权限的用户需要有足够的权限，否则将无法修改文件的权限。

### Check the python and rely version

列出所有正在运行的 Docker 容器

      docker ps

进入指定的 Docker 容器

      docker exec -it ${PROJECT}_Container /bin/bash

在容器内查询安装的 Python 包及其版本

      pip list