#!/bin/bash

NNP_HOME="/usr/nkia"
NNP_AGENT=$(find $HOME -type f -name "NNPAgent_SMS*")
Without_extension="${NNP_AGENT%.*.*}"

# NNP 기본 디렉터리 /usr/nkia 디렉터리가 없으면 생성하는 구문
if [ ! -d "$NNP_HOME" ]; then
    mkdir -p "$NNP_HOME"
    echo "Created $NNP_HOME "
else
    echo "$NNP_HOME already exists"
fi

if [ -n "$NNP_AGENT" ]; then 
    tar zxvf ${Without_extension}.tar.gz -C "$NNP_HOME"
else
    echo "NOT FOUND"
fi

cd "$NNP_HOME"

./AgentInstall.sh -t 2