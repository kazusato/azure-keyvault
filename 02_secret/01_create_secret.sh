#!/usr/bin/env bash

if [ $# != 2 ]
then
  echo "Usage: $0 key-vault-name secret-name"
  exit 1
fi

VAULT_NAME=$1
SECRET_NAME=$2

# Set static value instead of generating password
PASSWORD="lkD1jf;la4kjAjFd"

# Creating secret
az keyvault secret set --vault-name $VAULT_NAME --name $SECRET_NAME --value $PASSWORD \
  --description "Test password"
