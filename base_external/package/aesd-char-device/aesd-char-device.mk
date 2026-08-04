
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD-CHAR-DEVICE_VERSION = '9ec9ddfdce24be69d3580f472bac068ee6413c8f' # assignment-8 in assignments-3 repo
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD-CHAR-DEVICE_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-eyas-UC.git'
AESD-CHAR-DEVICE_SITE_METHOD = git
AESD-CHAR-DEVICE_GIT_SUBMODULES = YES

AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver

define AESD-CHAR-DEVICE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server clean
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD-CHAR-DEVICE_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar.ko $(TARGET_DIR)/usr/bin/aesdchar.ko
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/S97aesdchardevice $(TARGET_DIR)/etc/init.d/S97aesdchardevice

endef


$(eval $(kernel-module))
$(eval $(generic-package))

