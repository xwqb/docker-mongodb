#!/bin/bash
path=$(cd `dirname $0`;pwd)

#echo "cfg= {_id: 'gyrls', members: []};cfg.members.push({_id:1, host:'106.12.89.85:27000',priority: 100},{_id:2, host:'106.12.89.85:27001',priority: 50},{_id:3, host:'106.12.89.85:27002',priority: 50});rs.initiate(cfg)" | $path/bin/mongo 127.0.0.1:27000
#echo -e "\033[33mbuild mongo replSet,pleasse wait..\033[0m"
#sleep 3s

echo -e "\033[33mcreate replSet,pleasse wait..\033[0m"

$path/bin/mongo 127.0.0.1:27000 < create_replSet.data
sleep 5s
echo -e "\033[32mcreate replSet end!\033[0m"

echo -e "\033[33madd user:superadmin,pleasse wait..\033[0m"
add_user(){
 sleep 10s
 $path/bin/mongo 127.0.0.1:27000 < pass.data
}
add_user
echo -e "\033[33madd user end \033[0m"


echo -e "\033[32minit access.key\033[0m"
init_access(){
openssl rand -base64 756 > access.key
chmod 400 access.key

for dir in `seq 27000 27002`;do
 sed -i "s/\#    keyFile/     keyFile/g" work_spac/$dir/conf/mongodb.conf
 sed -i "s/\#security/security/g" work_spac$dir/conf/mongodb.conf
 sed -i "s/\#    authorization/     authorization/g" work_spack/$dir/conf/mongodb.conf
done

}
init_access
echo -e "\033[32minit access.key done\033[0m"

echo -e "\033[33mrestart mongodb,please wait..\033[0m"

restart_mongodb(){
# stop
for dir in `seq 27000 27002`;do
  kill -2 `cat work_spac/$path/$dir/mongod.pid`
  echo -e "\033[32mstop successed mongodb port $dir\033[0m"
  sleep 2s
done
# start
for dir in `seq 27000 27002`;do
  $path/bin/mongod -f work_spac/$path/$dir/conf/mongodb.conf
done


echo -e "\033[32mrestart mongodb end\033[0m"

}
restart_mongodb

echo -e "\033[32mnow you can connect your mongodb replSet ,over!\033[0m"

