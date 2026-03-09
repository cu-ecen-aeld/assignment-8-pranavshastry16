################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = 2389d803fbf3206075a0c95b68691128f2306ca4

LDD_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-pranavshastry16.git
LDD_SITE_METHOD = git

LDD_MODULE_SUBDIRS = aesd-char-driver

$(eval $(kernel-module))
$(eval $(generic-package))
