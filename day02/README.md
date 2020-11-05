1. 先在根目录执行
    
    ~~~bash
    # 如果已经布置好Docker不用执行
    make pull
    make up (启动虚拟机容器)
    ~~~
2. `cd` 到当前目录
    
    ~~~bash
    cd ./day02
    # 执行 make 可以生成img等文件
    make
    # 用虚拟机查看系统
    make qemu
    # 清除所有非源文件
    make src_only
    ~~~