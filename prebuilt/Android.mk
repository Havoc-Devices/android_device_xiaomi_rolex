LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := init.spectrum.rc
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES  := etc/init.spectrum.rc
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE    := init.spectrum.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES  := etc/init.spectrum.sh
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)

include $(CLEAR_VARS)
LOCAL_MODULE    := init.optimkang.sh
LOCAL_MODULE_TAGS  := optional eng
LOCAL_MODULE_CLASS  := ETC
LOCAL_SRC_FILES  := etc/init.optimkang.sh
LOCAL_MODULE_PATH  := $(TARGET_ROOT_OUT)
include $(BUILD_PREBUILT)

