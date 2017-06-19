################################################################################
#
# glusterfs
#
################################################################################

GLUSTERFS_VERSION = 3.11.0
GLUSTERFS_SITE = https://download.gluster.org/pub/gluster/glusterfs/${GLUSTERFS_VERSION%.*}/$(GLUSTERFS_VERSION)
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
