#!/usr/bin/env bash

source /root/config/user.properties.sh

echo "creating user $dr_selfie_user"
if [ ! -d "/home/$dr_selfie_user" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  useradd $dr_selfie_user
  echo $dr_selfie_password | passwd $dr_selfie_user --stdin
  # provided we have this line in : %wheel	ALL=(ALL)	ALL
  # else add with viusudo : 'selfie	ALL=(ALL)	ALL' in etc/sudousers manually!
  # in centos modify in sudousers also .. Defaults requiretty and Defaults !visiblepw
  gpasswd -a $dr_selfie_user wheel
 else
  echo "User $dr_selfie_user already exists"
fi

echo "Done _user"