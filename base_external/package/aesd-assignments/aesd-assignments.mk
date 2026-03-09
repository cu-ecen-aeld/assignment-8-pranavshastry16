################################################################################
#
# aesd-assignments
#
# Buildroot package for pulling my assignments-3-and-later repo and installing
# the Assignment 8 userspace application pieces.
#
# For Assignment 8 this package installs:
#   - /usr/bin/aesdsocket
#   - /etc/init.d/S99aesdsocket
#
################################################################################


AESD_ASSIGNMENTS_VERSION = 2389d803fbf3206075a0c95b68691128f2306ca4


# Pull the source from my assignments-3-and-later repo
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-pranavshastry16.git
AESD_ASSIGNMENTS_SITE_METHOD = git

# Build only the server portion, cross-compiling for the Buildroot target
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/server \
		CC="$(TARGET_CC)" \
		CFLAGS="$(TARGET_CFLAGS) -DUSE_AESD_CHAR_DEVICE=1" \
		LDFLAGS="$(TARGET_LDFLAGS)" \
		all
endef


# Install the aesdsocket binary and startup script into the target rootfs
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket

	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))
