
##############################################################
#
# AESD-CHAR-DEVICE
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_CHAR_DEVICE_VERSION = '0ce4d9d85e2cc6265b1d50678392b746e216a8b6' # assignment-8 in assignments-3 repo
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_CHAR_DEVICE_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-eyas-UC.git'
AESD_CHAR_DEVICE_SITE_METHOD = git
AESD_CHAR_DEVICE_GIT_SUBMODULES = YES

AESD_CHAR_DEVICE_MODULE_SUBDIRS = aesd-char-driver


# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_CHAR_DEVICE_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/init.d
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/etc/init.d/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/etc/init.d/aesdchar_unload

endef


$(eval $(kernel-module))
$(eval $(generic-package))

