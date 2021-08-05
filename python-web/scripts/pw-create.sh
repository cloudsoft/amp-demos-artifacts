#!/bin/bash

echo 'Install python if not present'

sudo which python || \
 { sudo apt-get update && sudo apt-get install -y python ; } || \
 { sudo yum update && sudo yum install python ; } || \
 { sudo echo WARNING: cannot install python && exit 1 ; }
