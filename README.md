# FreeCAD Docker

This Repository is built upon the repos: 
- https://gitlab.com/daviddaish/freecad_docker_env
- https://github.com/airvzxf/freecad-docker
  

It houses the build files for Docker images for FreeCAD Development Environments.

## Current State

The container image created by David Daish can be thought of as a container image of required dependencies for FreeCAD to built within. This means you still have to download the source code and compile right from the start. This workflow is sub-optimal as the dependency layer is different for each release. While possible to maintain over time, this seems to defeat the purpose of containers.

This main branch is still in development. 

The first goal is to get it working easily and as-is for FreeCAD v0.19.2 as that is the version used in the aforementioned repos.

Afterwards the todo is as follows:

- [ ] Create a docker image registry for FreeCAD-Docker Images for each stable release. 
- [ ] Create images that store initial build files so that there is no need to run the initial build cycle for standard FreeCAD releases. (unclear how far back this needs to go)

## Setup

Setup.sh will run you through the setup process so that FreeCAD can run in a container and forward the display through X window to your local dev environment.

CAUTION: If you run Setup.sh multiple times it will overwrite the directory structure it created in previous runs.

`docker compose up` afterwards to get it running.

## RoadMap

### v1.0
- Create template for using personal forked repos and custom compose files.
- Modify Docker-compose files to use local directories if they exist or default to container directories if not.
- Store source, builds, and files for any number of FreeCAD versions in an organized way.
- Run multiple FreeCAD versions in multiple containers at the same time

### v2.0

- Run Cross-Platform
  
    
### FYI

I personally use a cloud development environment called gitpod.com, which is the simplest way to test this system out for yourself without touching your local machine. Gitpod offers a free tier if you want to try it out. Not a spokesperson, just love the product. If you would like to try it then you need to open https://github.com/JesseRigon/FreeCAD-GP in a gitpod workspace as it has configuration files needed to get this to work there. Additional directions will be on that repo's readme.
