# Inherit common DerpFest stuff
$(call inherit-product, vendor/derp/config/common.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include DerpFest LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/overlay/dictionaries
