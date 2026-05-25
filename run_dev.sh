#!/bin/bash

sudo docker build -t dotfiles:dev -f docker/Dockerfile .
sudo docker run -it --rm dotfiles:dev bash
