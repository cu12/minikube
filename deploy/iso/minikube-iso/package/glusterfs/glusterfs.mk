################################################################################
#
# glusterfs
#
################################################################################

GLUSTERFS_MAJOR = 3
GLUSTERFS_MINOR = 11
GLUSTERFS_BUILD = 0
GLUSTERFS_VERSION = $(GLUSTERFS_MAJOR).$(GLUSTERFS_MINOR).$(GLUSTERFS_BUILD)
GLUSTERFS_SITE = https://download.gluster.org/pub/gluster/glusterfs/$(GLUSTERFS_MAJOR).$(GLUSTERFS_MINOR)/$(GLUSTERFS_VERSION)
GLUSTERFS_SOURCE = glusterfs-$(GLUSTERFS_VERSION).tar.gz
GLUSTERFS_DEPENDENCIES = host-flex host-bison openssl acl
GLUSTERFS_AUTORECONF=YES

$(eval $(generic-package))
