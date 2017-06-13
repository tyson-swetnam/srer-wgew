# Installing a X11 viewer in Windows 10 with `Bash` terminal

## XMing
Download [XMing](https://sourceforge.net/projects/xming)

[Video tutorial for running XMing](https://channel9.msdn.com/Blogs/WinCoder/XMING--Bash-on-Ubuntu-on-Windows--X11-Window-System-Running-from-Windows10-Subsystem-for-Linux)

## Vcxsrv

Alternately, download  [VcXsrv](https://sourceforge.net/projects/vcxsrv/files/latest/download)

## Test

Set the display on the local host

```
export DISPLAY=localhost:0.0
```

Test the display

```
sudo apt-get -y install x11-apps
xeyes
```
There should be a pair of eyeballs staring at your cursor. 
