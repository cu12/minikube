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

define GLUSTERFS_AUTOGEN
    cd $(@D)/glusterfs-$(GLUSTERFS_VERSION); ./autogen.sh
endef

define GLUSTERFS_BUILD_CMDS
  $(MAKE)
endef

define GLUSTERFS_
  $(INSTALL) -D -m 0755 \
    $(@D)/glusterfs-$(GLUSTERFS_VERSION) \
    $(TARGET_DIR)/usr/sbin/glusterfs
endef

$(eval $(generic-package))
