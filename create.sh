#!/bin/bash

if [ -e "docker-sync.yml" ];
then
    echo El proyecto ya ha sido creado
    exit 1
fi

if [ -z "$1" ];
then
  echo Indica el nombre del proyecto
  exit 2
fi

if [ -d "$1" ];
then
  echo Ya existe un directorio con ese nombre
  exit 3
fi

if ! which symfony > /dev/null; then
  echo "El script de instalación de symfony no se encuentra"
  exit 4
fi

echo "Instalando Symfony... "
symfony new $1
mv app_dev.php $1/web/app_dev.php

echo Configurando docker
sed -e "s#skel#$1#g" docker-compose.yml.dist > docker-compose.yml
sed -e "s#skel#$1#g" docker-sync.yml.dist > docker-sync.yml

rm docker-compose.yml.dist
rm docker-sync.yml.dist
rm $0
