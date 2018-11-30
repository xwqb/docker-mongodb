# docker-mongodb
This repostority is standalone server build mongodb-replSet ,if you build many external server that not supported!
### `custom_params.conf` is custom defined your's mongodb replSet params
## How to build?
##### step:1
git clone https://github.com/xwqb/docker-mongodb.git && cd docker-mongodb
##### step:2
wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-4.0.4.tgz && 
tar -xzf mongodb-linux-x86_64-4.0.4.tgz && cp -r mongodb-linux-x86_64-4.0.4/bin bin
##### step:3
`./startup.sh` build and start your mongodb-replSet
##### step:4
`./shutdown.sh` stop your mongodb-replSet
## Where are my data?
In this path `work_spac/2700x/data` sepecified your db data
## Support Docker image
Build container for docker,you only run `docke-build-mongo.sh` that can build your docker images,and use `docker-*-mongo.sh` operate your docker,if has some bug ,please feedback for me
