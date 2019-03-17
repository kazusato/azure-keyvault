#!/usr/bin/env bash

if [ $# != 2 ]
then
  echo "Usage: $0 resource-group-name key-vault-name"
  exit 1
fi

RG_NAME=$1
VAULT_NAME=$2

# Creating resource group
az group create -n $RG_NAME -l japaneast

if [ $? != 0 ]
then
  echo "Creating resource group $RG_NAME failed."
  exit 1
fi

# Creating key vault
az keyvault create -n $VAULT_NAME -g $RG_NAME

if [ $? != 0 ]
then
  echo "Creating key vault failed."
  echo "Deleting resource group $RG_NAME ..."
  az group delete -n $RG_NAME -y
fi
