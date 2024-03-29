#!/bin/bash

# Checking the version of Polly CLI
polly --version
# login into Polly with Polly CLI inside a Polly job
polly login --auto

## get the file into the docker from polly CLI
polly files copy --workspace-id ${WORKSPACE_ID} --source polly://${FILE_PATH_SOURCE} --destination "./launcher.sh"

## launch the file you just imported into the docker
chmod +x ./launcher.sh
./launcher.sh