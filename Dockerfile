ARG FREECAD_DEV_IMAGE
FROM ${FREECAD_DEV_IMAGE}

# Build FreeCAD
CMD /root/build_script.sh;/mnt/build/bin/FreeCAD