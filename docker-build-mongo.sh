path=$(cd ` dirname $0`;pwd)
docker build -t mongodb:4.0.4 $path
