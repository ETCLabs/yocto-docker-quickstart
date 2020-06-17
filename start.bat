@echo off

docker container run ^
  -it ^
  --rm ^
  --name etcdev-yocto ^
  -v "%CD%\workspace\sources":/opt/yocto/workspace/sources ^
  -v "%CD%\cache":/opt/yocto/cache ^
  -v "%CD%\home":/home/yocto ^
  cccp/yocto:1.1
