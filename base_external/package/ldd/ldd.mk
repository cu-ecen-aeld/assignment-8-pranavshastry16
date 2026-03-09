################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = b9748a0777d2729886233df924a30f2ec856feef

LDD_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-pranavshastry16.git
LDD_SITE_METHOD = git

LDD_MODULE_SUBDIRS = aesd-char-driver

$(eval $(kernel-module))
$(eval $(generic-package))
