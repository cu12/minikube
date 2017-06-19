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



define GLUSTERFS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
GLUSTERFS_PRE_CONFIGURE_HOOKS += GLUSTERFS_RUN_AUTOGEN

define GLUSTERFS_CONFIGURE_CMDS
  cd $(@D) && PATH=$(BR_PATH) \
  LDFLAGS="$(HOST_LDFLAGS)"
    ./configure
endef

define GLUSTERFS_BUILD_CMDS
  $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

define GLUSTERFS_
  $(INSTALL) -D -m 0755 \
    $(@D)/glusterfs \
    $(TARGET_DIR)/usr/sbin/glusterfs
endef

$(eval $(generic-package))
