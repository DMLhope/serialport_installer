# 使用指南

1. 切换到root用户(也可以用sudo)
2. 请务必注意卸载将要写入的磁盘（不卸载脚本会自动卸载）
3. ./serialport_installer.sh [rootfs.img文件]
    例如：
        ./serialport_installer.sh rootfs-v15.img
4. 也可以将文件移动到 `/rootfs.img` 后可直接执行脚本 : ./serialport_installer.sh
5. 启动脚本后根据提示安装即可
