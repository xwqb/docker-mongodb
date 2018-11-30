path=$(cd `dirname $0`;pwd)
docker run --name mongodb --privileged=true --net=host -d mongodb:4.0.4
#docker exec redis /bin/bash /redis/cluster/trib-cluster.sh
