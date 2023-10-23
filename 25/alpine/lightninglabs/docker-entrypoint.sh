#!/bin/sh
set -e

# Check if HOST_UID is set and not 0
if [ -n "${HOST_UID+x}" ] && [ "${HOST_UID}" != "0" ]; then
  usermod -u "$HOST_UID" $USER_NAME # Change the user ID to HOST_UID
fi

# Check if HOST_GID is set and not 0
if [ -n "${HOST_GID+x}" ] && [ "${HOST_GID}" != "0" ]; then
  if grep -q ":$HOST_GID:" /etc/group; then # if group exists
    usermod -a -G $HOST_GID $USER_NAME # Add USER_NAME to Group ID HOST_GID
  else
    groupmod -g "$HOST_GID" $USER_NAME # Change the group ID to HOST_GID
  fi
fi

echo "$0: assuming uid:gid for ${USER_NAME}:${USER_NAME} of $(id -u $USER_NAME):$(id -g $USER_NAME)"

# add use home dir
data_dir="$USER_HOME/.${USER_NAME}"
mkdir -p $data_dir
chmod 700 $data_dir

# Get the home directory of $USER_NAME
home_dir=$(getent passwd $USER_NAME | cut -d: -f6)
# Change ownership of the home directory
chown -R $USER_NAME:$HOST_GID ${home_dir}
echo "reset home dir permissions for user ${USER_NAME}:${HOST_GID} done."
echo "start lnd with user ${USER_NAME}..."
exec su-exec $USER_NAME "$@" "-datadir=$data_dir" # Execute the command with the specified user
