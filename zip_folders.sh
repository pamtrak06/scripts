#!/bin/bash
# ----------------------------------------------------$
# The MIT License (MIT)$
#$
# Copyright (c) 2016 copyright pamtrak06@gmail.com$
# ----------------------------------------------------$
# SCRIPT           : zip_folders.sh$
# DESCRIPTION      : zip recursively all subfolders without git folders and exclude zip file
#                    ask for a password for zip encryption$
# CREATOR          : pamtrak06@gmail.com$
# --------------------------------$
# VERSION          : 1.0$
# DATE             : 2016-03-05$
# COMMENT          : creation$
# --------------------------------$
# USAGE            : ./zip_folders.sh
# ----------------------------------------------------$
folders=$(ls -d */|grep -v data)
echo enter password for zip encryption
read password
for f in $folders; do
  zipfile=${f%\/}.zip
  if [ -f $zipfile ]; then
    rm -f $zipfile
  fi
  echo zip $zipfile from folder $f...
  zip --password $password -r $zipfile $f -x *.git* -x \*.zip
done
ls -la *.zip

