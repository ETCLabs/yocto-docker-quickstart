@echo off

REM We can't mount /opt/yocto or /opt/yocto/workspace as volumes in Windows, because this will make
REM bitbake fail (it tries to create a UNIX domain socket with the path to its current directory,
REM and for whatever reason that doesn't work in a mounted volume on Windows). So the mounts need
REM to be a bit more granular, so that /opt/yocto/workspace/build is not a volume and only exists
REM inside the container.

docker container run ^
  -it ^
  --rm ^
  --name etcdev-yocto ^
  -v "%CD%\workspace\sources":/opt/yocto/workspace/sources ^
  -v "%CD%\cache":/opt/yocto/cache ^
  -v "%CD%\home":/home/yocto ^
  cccp/yocto:1.1
