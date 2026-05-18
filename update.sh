#!/usr/bin/env bash

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
  case $1 in
  --dev)
    APP_ENV="development"
    ;;
  esac
  shift
done
if [[ "$1" == '--' ]]; then shift; fi

APP_ENV="${APP_ENV:-production}"

echo "Updating AzuraCast (Environment: $APP_ENV, Update revision: $UPDATE_REVISION)"

ansible-playbook ansible/update.yml --inventory=ansible/hosts --extra-vars "app_env=$APP_ENV"
