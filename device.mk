#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Camera
PRODUCT_SYSTEM_PROPERTIES += \
    ro.product.mod_device=redwood_global
	
# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.nfc.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.nfc.rc

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-everest

# Overlays-RRO
PRODUCT_PACKAGES += \
    redwoodCNSettingsProviderOverlay \
    redwoodCNWifiOverlay \
    redwoodGLSettingsProviderOverlay \
    redwoodGLWifiOverlay \
    redwoodINSettingsProviderOverlay \
    redwoodINWifiOverlay \
    redwoodNfcOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SurfaceFlinger
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=4000 \
    ro.surface_flinger.set_display_power_timer_ms=1000

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/audio_platform_info_yupikidp.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_default_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_default_stream_volumes.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_product_strategies.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_product_strategies.xml \
    $(LOCAL_PATH)/audio/audio_policy_engine_stream_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_engine_stream_volumes.xml \
    $(LOCAL_PATH)/audio/mixer_paths_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_yupikidp.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_dynamic.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_dynamic.xml \
    $(LOCAL_PATH)/audio/mixer_paths_overlay_static.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/mixer_paths_overlay_static.xml \
    $(LOCAL_PATH)/audio/sound_trigger_mixer_paths_yupikidp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_mixer_paths_yupikidp.xml \
    $(LOCAL_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_yupik/sound_trigger_platform_info.xml
	
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/media/audio,$(TARGET_COPY_OUT_PRODUCT)/media/audio)

# Sku properties
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/sku/,$(TARGET_COPY_OUT_ODM)/etc)

# WiFi Display
PRODUCT_SYSTEM_PROPERTIES += \
    vendor.sys.video.disable.ubwc=1

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/redwood/redwood-vendor.mk)
