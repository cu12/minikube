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
GLUSTERFS_DEPENDENCIES = acl openssl liburcu sqlite

GLUSTERFS_CONF_ENV = \
  ac_cv_file__etc_debian_version=no \
  ac_cv_file__etc_redhat_release=no \
  ac_cv_file__etc_SuSE_release=no

define GLUSTERFS_RUN_AUTOGEN
    cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
endef
GLUSTERFS_POST_PATCH_HOOKS += GLUSTERFS_RUN_AUTOGEN

$(eval $(autotools-package))
