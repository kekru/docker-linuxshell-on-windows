# Linux shell on Windows inside a container
Get a Linux-Shell on Windows, by starting this image in Docker for Windows. Currently using fish shell.

## Install
Be sure, that you can run docker-Commands on your local windows command line.  
This is tested with Docker for Windows.  

Build the image:  
`git clone https://github.com/kekru/docker-linuxshell-on-windows.git`  
`docker build -t shell docker-shell-for-work`  

Then open `RegisterContextMenu.reg` with a double-click. After that, you'll find a "Docker Shell"-entry in your Explorer's context menu, when you click on an empty space in a directory.  
The shell will open and your current directory is  mounted in /data inside the shell's container.

## Remove context menu entry  
Run "regedit" in Windows. Navigate to HKEY_CLASSES_ROOT\Directory\Background\shell and delete "DockerShellKeKru"
