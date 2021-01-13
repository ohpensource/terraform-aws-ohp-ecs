#!/bin/bash

# Connecting an existing repository to a local non-empty folder

git init
git add .
git commit -m 'start'
git remote add origin http://bitbucket.org/ohpen-dev/terraform-aws-ns-ecs
git push -u origin master