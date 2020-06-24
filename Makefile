DEBUG=0
FINALPACKAGE=1

ARCHS = arm64 arm64e
THEOS_PACKAGE_DIR_NAME = debs

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Dim
Dim_FILES = $(wildcard tweak/*.m tweak/*.mm tweak/*.x tweak/*.xm)
Dim_FRAMEWORKS = UIKit
Dim_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += ccmodule
SUBPROJECTS += preferences
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
