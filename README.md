# FreeCAD Docker

This Repository is built upon the repos: 
- https://gitlab.com/daviddaish/freecad_docker_env
- https://github.com/airvzxf/freecad-docker
  

It houses the build files for Docker images for FreeCAD Development Environments.

## Setup and Run

`sh setup.sh`

Runs setup.sh which goes through the setup process so that FreeCAD can run in a container and forward the display through X window to your local dev environment. It pulls env variables from .env, where you may change the source version used (not tested with any other than 19.2 currently) and the dependency image link

CAUTION: If you run Setup.sh multiple times it will overwrite the directory structure it created in previous runs.

`sh run.sh` 

Runs a couple commands to finalize set up and then builds and runs the docker containers. This will automatically run FreeCAD build on every start (after first build should be fairly quick process) and subsequently run FreeCAD binary.  
  
  
## RoadMap

### Current State v0.5

The container image used, created by David Daish, can be thought of as a container image of required dependencies for FreeCAD to be built within. This means you still have to download the source code (done automatically with setup.sh) and build & compile from source right from the start (run.sh will start the containers and run this initial build: This could take a while). 

This workflow is sub-optimal as the dependency layer might be different for each release, which might require conflicting dependencies. While possible to maintain over time in a single image, this seems hard and to defeat the purpose of containers.

For the above reason, I believe the best way forward is to:

- [ ] Create a docker image registry for FreeCAD-Docker Images for each stable release. 
- [ ] Create a dependency image per major official release starting from 0.19, as well as for the daily build. Each dev image should be compatible will all minor releases within a major release.
- [ ] [OPTIONAL] look at creating images that store initial build files so that there is no need to run the initial build cycle for all standard FreeCAD minor releases.

These changes are needed but are outside the scope of this repo and therefore are not included in the following 

### v1.0  ***See branch v1.0***
  *other than fixing errors this list is currently done. Any further changes, or feature requests will be applied to v2.0
  
- [ ] Create templates for creating and using personal forked repos and custom docker files.
- [ ] Modify Docker-compose files to use local directories if they exist or default to container directories if not.
- [ ] Store source, builds, and files for any number of FreeCAD versions in an organized way.
- [ ] Run multiple FreeCAD versions in multiple containers at the same time

### v2.0

- [ ] Run Cross-Platform (while the docker image can be run cross-platform, obviously, the scripts are bash scripts and linux based; should work on mac but haven't tested)
  
### FYI

I personally use a cloud development environment called gitpod.com, which is the simplest way to test this system out for yourself without touching your local machine. Gitpod offers a free tier if you want to try it out. Not a spokesperson, just love the product. If you would like to try it then you can use https://github.com/JesseRigon/FreeCAD-GP in a gitpod workspace as it has configuration files needed to get this to work there. Additional directions will be on that repo's readme.
