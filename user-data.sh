#!/bin/bash
java -version 

if [ $? -ne 0 ]; then
yum install java -y 
fi 

python  --version 

if [ $? -ne 0 ]; then
yum install python2 -y

## this will linke python2 to python so we can use python2 as one make sure to use from inside or give pull path
ln -s /usr/bin/python2 /usr/bin/python 
fi 

type pip 

if [ $? -ne 0 ]; then 
ln -s /usr/bin/pip2 /usr/bin/pip 
fi 

type aws 

if [ $? -ne 0 ]; then
pip install awscli --user  
fi 

export PATH=~/.local/bin:$PATH

aws s3 cp s3://maven-buckets/gs-spring-boot-0.1.0.jar .

java -jar gs-spring-boot-0.1.0.jar

 
  

