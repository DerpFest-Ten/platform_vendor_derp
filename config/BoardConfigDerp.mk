# APEX
ifneq ($(filter Official CI Private,$(DERP_BUILDTYPE)),)
    TARGET_FLATTEN_APEX := true
endif

include vendor/derp/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/derp/config/BoardConfigQcom.mk
endif

include vendor/derp/config/BoardConfigSoong.mk
