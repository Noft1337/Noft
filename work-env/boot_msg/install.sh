#!/bin/bash

if [[ $UID -ne 0 ]]; then
    echo "Must be root to install boot_msg"
    exit 255
fi

# Copy the boot_msg files so that initcpio will acknowledge them
cp rainbow_msg /etc/initcpio/hooks/rainbow_msg
cp rainbow_msg_install /etc/initcpio/install/rainbow_msg

# Set them to be executable
chmod a+x /etc/initcpio/hooks/rainbow_msg
chmod a+x /etc/initcpio/install/rainbow_msg

# Append the hook of rainbow_msg to initcpio config
# If you want it to run before/after a specifig hook, change the position of rainbow_msg the hook
sed -i 's/HOOKS=(\(.*\))/HOOKS=(\1 rainbow_msg)/' /etc/mkinitcpio.conf

# Regenerate the inircpio
mkinitcpio -P
