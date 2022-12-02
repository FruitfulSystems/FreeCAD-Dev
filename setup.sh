#!/usr/bin/env sh

. ./.env

if [ ${USE_CUSTOM_REPOSITORY} = "true" ]; then
  
  echo "# ------------------------------------------"
  echo "# Downloading LATEST FreeCAD Source Files."
  echo "# ------------------------------------------"
  
  git clone ${CUSTOM_SOURCE_REPOSITORY} ${SOURCE_FOLDER}

else [ ! -f "${SOURCE_FOLDER}/${TAG_NUMBER}${COMPRESS_FORMAT}" ];
  
  rm -fR "${SOURCE_FOLDER}"
  mkdir -p "${SOURCE_FOLDER}"
  
  echo "# ------------------------------------------"
  echo "# Downloading ARCHIVED FreeCAD version."
  echo "# https://github.com/FreeCAD/FreeCAD/archive/refs/tags/${TAG_NUMBER}${COMPRESS_FORMAT}"
  echo "# ------------------------------------------"
  
  curl \
    -L "https://github.com/FreeCAD/FreeCAD/archive/refs/tags/${TAG_NUMBER}${COMPRESS_FORMAT}" \
    -o "FreeCAD-${TAG_NUMBER}-Source${COMPRESS_FORMAT}"

  echo "# ------------------------------------------"
  echo "# UNCOMPRESS: The FreeCAD source code."
  echo "# ------------------------------------------"

  if [ ${COMPRESS_FORMAT} = ".tar.gz" ]; then
    tar -zxf "FreeCAD-${TAG_NUMBER}-Source${COMPRESS_FORMAT}" --strip-components 1 -C "${SOURCE_FOLDER}"
    rm -f "FreeCAD-${TAG_NUMBER}-Source${COMPRESS_FORMAT}"
  fi

  if [ ${COMPRESS_FORMAT} = ".zip" ]; then
    TEMPORAL_DIRECTORY=$(mktemp -d)
    unzip -q "$FreeCAD-${TAG_NUMBER}-Source${COMPRESS_FORMAT}" -d "${TEMPORAL_DIRECTORY}"
    # shellcheck disable=SC2039
    mv "${TEMPORAL_DIRECTORY}"/*/{.[!.],}* "${SOURCE_FOLDER}"
    rm -fR "${TEMPORAL_DIRECTORY}"
    rm -f "FreeCAD-${TAG_NUMBER}-Source${COMPRESS_FORMAT}"
  fi
fi

mkdir -p "${BUILD_FOLDER}"
mkdir -p "${FILES_FOLDER}"

echo "# ------------------------------------------"
echo "# Download FreeCAD Docker Image"
echo "# ------------------------------------------"

docker pull $FREECAD_DEV_IMAGE