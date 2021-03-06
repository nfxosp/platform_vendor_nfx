## Common NFX Config ##

# Superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.nfx.superuser

PRODUCT_PACKAGES += \
	Superuser \
	su

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.root_access=3

# Boot animation
PRODUCT_COPY_FILES += \
	vendor/nfx/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# NFX init.rc
PRODUCT_COPY_FILES += \
	vendor/nfx/prebuilt/common/etc/init.nfx.rc:root/init.nfx.rc

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=false \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.setupwizard.enterprise_mode=1

# init.d support
PRODUCT_COPY_FILES += \
	vendor/nfx/prebuilt/common/bin/sysinit:system/bin/sysinit \
	vendor/nfx/prebuilt/common/etc/init.d/00nfx:system/etc/init.d/00nfx

PRODUCT_PACKAGES += \
	CellBroadcastReceiver \
	Launcher3

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/nfx/overlay/common
