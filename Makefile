THEOS_DEVICE_IP = 172.30.7.222
THEOS_DEVICE_PORT = 22
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCRevealLoader
CCRevealLoader_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

before-package::
	@echo "Downlading reveal server framework..."
	mkdir -p ./layout/Library/Application\ Support/CCRevealLoader/
	cp -r  /Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/RevealServer.framework ./layout/Library/Application\ Support/CCRevealLoader/
	lipo -remove i386 ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework/RevealServer -o ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework/RevealServer
	lipo -remove x86_64 ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework/RevealServer -o ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework/RevealServer
	codesign -f -s "iPhone Developer: ChengFang  Chen (4YVJ336CK2)" ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework
after-install::
	install.exec "killall -9 SpringBoard"
