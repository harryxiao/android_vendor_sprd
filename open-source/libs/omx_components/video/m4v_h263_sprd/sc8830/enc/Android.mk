LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        SPRDMPEG4Encoder.cpp

LOCAL_C_INCLUDES := \
        frameworks/av/media/libstagefright/include \
	frameworks/native/include/media/hardware \
	$(TOP)/vendor/sprd/open-source/libs/libstagefrighthw/include \
	$(TOP)/vendor/sprd/open-source/libs/libstagefrighthw/include/openmax \
	$(TOP)/vendor/sprd/open-source/libs/libmemoryheapion \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL/usr/include/video

ifeq ($(strip $(TARGET_GPU_PLATFORM)),midgard)
    LOCAL_C_INCLUDES += $(TOP)/vendor/sprd/modules/libgpu/gralloc/midgard
else
    LOCAL_C_INCLUDES += $(TOP)/vendor/sprd/modules/libgpu/gralloc/utgard
endif

LOCAL_CFLAGS := -DOSCL_EXPORT_REF= -DOSCL_IMPORT_REF=

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES := \
        libstagefright libstagefright_omx libstagefright_foundation libstagefrighthw libutils  libui libmemoryheapion libdl liblog

LOCAL_MODULE := libstagefright_sprd_mpeg4enc
LOCAL_MODULE_TAGS := optional

ifeq ($(strip $(TARGET_BOARD_CAMERA_ANTI_SHAKE)),true)
LOCAL_CFLAGS += -DANTI_SHAKE
endif

include $(BUILD_SHARED_LIBRARY)