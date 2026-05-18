#!/usr/bin/env bash

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
  case $1 in
  --dev)
    APP_ENV="development"
    shift
    ;;
  esac
  shift
done
if [[ "$1" == '--' ]]; then shift; fi

APP_ENV="${APP_ENV:-production}"

echo "Installing AzuraCast (Environment: $APP_ENV)"
ansible-playbook ansible/deploy.yml --inventory=ansible/hosts --extra-vars "app_env=$APP_ENV"
