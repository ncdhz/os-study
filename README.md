# 30自制操作系统
### 里面所有代码都是在mac环境下编写
1. 在学习《30自制操作系统》这本书时所编写的代码
2. day01 表示第一天学习的内容
### 环境是docker
1. 感谢《30自制操作系统》提供的`Docker`环境，开源项目地址 [https://github.com/HariboteOS/tolenv](https://github.com/HariboteOS/tolenv)
2. 下载本项目 `cd` 到项目里面
3. 安装 `Docker` 并启动 `Docker`

    ```
    执行：docker --version
    输出：Docker version 19.03.12, build 48a66213fe （可能版本有一点差别）
    ```
4. 执行 `make pull` 拉取镜像
    + 执行 `make up` 可以运行容器
    + 执行 `make down` 可以关闭容器
### 下面是安装 nasm 和 qemu
4. 汇编编译器 `nasm` 
    + 下载
    
    ```
    brew install nasm
    ```
    + 使用
    
    ```
    nasm -f bin helloos.asm -o helloos.img
    # helloos.asm 源文件 helloos.img 生成文件
    ```
5. 虚拟机 `qemu`
    + 下载
    
    ```
    brew install qemu
    ```
    + 使用

    ```
    qemu-system-i386 -hdd helloos.img
    ```