#!/bin/bash
cd ./modules
for f in *; do
  if [ -d "$f" ]; then
    # cycle through each module dir and initialize
    cd "$f"
    terraform init -input=false -backend=false
    if [ $? != "0" ]; then exit $?; fi
    
    cd ..
  fi
done

source ../.bitbucket/lint.sh
source ../.bitbucket/validate.sh
