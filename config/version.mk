# Copyright (C) 2016-2019 AOSiP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
BUILD_DATE ?= $(shell date +%Y%m%d)
TARGET_PRODUCT_SHORT := $(subst derp_,,$(DERP_BUILDTYPE))

DERP_BUILDTYPE ?= Beta
DERP_BUILD_VERSION := 10

ifeq ($(DERP_BUILDTYPE), CI)
    DERP_VERSION := $(DERP_BUILD_VERSION)-Bare-$(DERP_BUILDTYPE)-$(DERP_BUILD)-$(shell date -u +%Y%m%d-%H%M)
endif

ifndef DERP_VERSION
    DERP_VERSION := $(DERP_BUILD_VERSION)-Bare-$(DERP_BUILDTYPE)-$(DERP_BUILD)-$(BUILD_DATE)
endif

ROM_FINGERPRINT := DerpFest/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(shell date -u +%H%M)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.derp.build.version=$(DERP_BUILD_VERSION) \
  ro.derp.build.date=$(BUILD_DATE) \
  ro.derp.buildtype=$(DERP_BUILDTYPE) \
  ro.derp.fingerprint=$(ROM_FINGERPRINT) \
  ro.derp.version=$(DERP_VERSION) \
  ro.derp.device=$(DERP_BUILD) \
  ro.modversion=$(DERP_VERSION)
