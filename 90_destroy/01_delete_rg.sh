#!/usr/bin/env bash

if [ $# != 1 ]
then
  echo "Usage: $0 resource-group-name"
  exit 1
fi

RG_NAME=$1

az group delete -n $RG_NAME -y
