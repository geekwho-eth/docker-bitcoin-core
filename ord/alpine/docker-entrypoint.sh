#!/bin/sh
set -e

if [ -n "${UID+x}" ] && [ "${UID}" != "0" ]; then
  usermod -u "$UID" $ORD_USER
fi

if [ -n "${GID+x}" ] && [ "${GID}" != "0" ]; then
  groupmod -g "$GID" $ORD_USER
fi

echo "$0: assuming uid:gid for ${ORD_USER}:${ORD_USER} of $(id -u $ORD_USER):$(id -g $ORD_USER)"

homeDir=$(getent passwd $ORD_USER | cut -d: -f6)
chown -R $ORD_USER:$ORD_USER $homeDir
echo "reset home dir permissions"
echo "start ord with user ord..."
exec gosu ord "$@"
