# FreeCAD Docker

This Repository is based on the repo: https://gitlab.com/daviddaish/freecad_docker_env

It houses the build files for Docker images for FreeCAD Development Environments.

Setup.sh will run you through the setup process for FreeCAD versions running in the container (Server) and forwarding the display through X window to your local dev environement.

## v0.1

This repo is in development: The goal of this main branch is to get it working for FreeCAD v0.19.2 as that is the version originally done in the aforementioned repo. If you run Setup.sh multiple times it will overwrite the directory structure it created in previous runs.

## Goals

v1.0 goals are to get it to store source, builds, and files for any number of FreeCAD versions stored locally, and then to be able to run multiple FreeCAD versions in multiple containers at one time from the same shell scripts.

v2.0 goals are to be able to run this cross platform with the same scripts.  
  
    

	

### FYI

I personally use a cloud development environment called gitpod.com, which is the simplest way to test this system out for yourself without touching your local machine. Gitpod offers a free tier if you want to try it out. Not a spokesperson, just love the product. If you would like to try it then you need to open https://github.com/JesseRigon/FreeCAD-GP in a gitpod workspace as it has configuration files needed to get this to work there. Additional directions will be on that repo's readme.
