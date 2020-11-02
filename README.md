# 30自制操作系统

1. 在学习《30自制操作系统》这本书时所编写的代码
2. day01 表示第一天学习的内容
3. 代码实现是基于 Mac 系统
4. 使用的汇编编译器是 `nasm` 
    + 下载
    
    ```
    brew install nasm
    ```
    + 使用
    
    ```
    nasm -f bin helloos.asm -o helloos.img
    # helloos.asm 源文件 helloos.img 生成文件
    ```
5. 使用的虚拟机是 `qemu`
    + 下载
    
    ```
    brew install qemu
    ```
    + 使用

    ```
    qemu-system-i386 -hdd helloos.img
    ```