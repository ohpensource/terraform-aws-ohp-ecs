#!/bin/bash
cd ./modules || exit
for f in *; do
  if [ -d "$f" ]; then
    # cycle through each module dir and initialize
    cd "$f" || exit
    if ! terraform init -input=false -backend=false; then exit $?; fi
    cd ..
  fi
done

chmod +x ../.bitbucket/*.sh
source ../.bitbucket/lint.sh
source ../.bitbucket/validate.sh
