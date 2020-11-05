; hello-os
; TAB=4

    ORG		0x7c00			; 指明程序装载地址

; 标准FAT12格式软盘专用的代码 Stand FAT12 format floppy code

    JMP		entry           ; entry 指向 0x7c50 地址
    DB		0x90
    DB		"HELLOIPL"		; 启动扇区名称（8字节）
    DW		512				; 每个扇区（sector）大小（必须512字节）
    DB		1				; 簇（cluster）大小（必须为1个扇区）
    DW		1				; FAT起始位置（一般为第一个扇区）
    DB		2				; FAT个数（必须为2）
    DW		224				; 根目录大小（一般为224项）
    DW		2880			; 该磁盘大小（必须为2880扇区1440*1024/512）
    DB		0xf0			; 磁盘类型（必须为0xf0）
    DW		9				; FAT的长度（必??9扇区）
    DW		18				; 一个磁道（track）有几个扇区（必须为18）
    DW		2				; 磁头数（必??2）
    DD		0				; 不使用分区，必须是0
    DD		2880			; 重写一次磁盘大小
    DB		0,0,0x29		; 意义不明（固定）
    DD		0xffffffff		; （可能是）卷标号码
    DB		"HELLO-OS   "	; 磁盘的名称（必须为11字?，不足填空格）
    DB		"FAT12   "		; 磁盘格式名称（必??8字?，不足填空格）
    RESB	18				; 先空出18字节

; 程序主体
entry:                      ; 入口
    MOV     AX, 0           ; 初始化寄存器 相当于 AX=0
    MOV     SS, AX          ; 相当于 SS=AX
    MOV     SP, 0x7c00
    MOV     DS, AX
    MOV     ES, AX
    MOV     SI, msg         ; 带入 msg 地址入 SI

putloop:
    MOV     AL, [SI]        ; [] 表示内存地址 MOV BYTE [678], 123 表示用 678号地址保存 123 这个数值。 BYTE 1 字节 WORD 2 字节 DWORD 4 字节 可以用来指定内存地址的寄存器有 BX BP SI DI。能向 AL 带入的只有 BYTE 所以就可以省略不写
    ADD     SI, 1           ; SI=SI+1
    CMP     AL, 0           ; 比较指令
    JE      fin             ; 跳转指令 根据上个比较语句 如果相等就执行这条跳转语句 不跳转就执行下一条语句 上面两天语句相当于 if (AL == 0) {goto fin;}
    MOV     AH, 0x0e        ; 显示一个文字
    MOV     BX, 15          ; 指定字符颜色
    INT     0x10            ; 调用显卡 BIOS
    JMP     putloop         ; 相当于 c 语言中的 goto

fin:
    HLT                     ; 让CPU停止，等待指令
    JMP     fin             ; 无限循环

msg:
    DB      0x0a, 0x0a      ; 换行 2 次
    DB      "hello world"
    DB      0x0a            ; 换行
    DB      0
    RESB	0x001fe-($-$$)	; 填写0x00直到0x001fe
    DB		0x55, 0xaa