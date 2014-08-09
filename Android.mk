LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := libzinnia
LOCAL_SRC_FILES := character.cpp feature.cpp libzinnia.cpp param.cpp recognizer.cpp sexp.cpp svm.cpp trainer.cpp
LOCAL_CFLAGS    := -DHAVE_CONFIG_H
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH) external/stlport
include external/stlport/libstlport.mk

$(LOCAL_PATH)/config.h: $(LOCAL_PATH)/android_config.h
	cp $(LOCAL_PATH)/android_config.h $(LOCAL_PATH)/config.h

include $(BUILD_STATIC_LIBRARY)

# JNI
include $(CLEAR_VARS)
LOCAL_MODULE    := libzinniajni
LOCAL_SRC_FILES := libzinniajni.cpp
LOCAL_STATIC_LIBRARIES := libzinnia
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := $(LOCAL_PATH)
include external/stlport/libstlport.mk
include $(BUILD_SHARED_LIBRARY)
