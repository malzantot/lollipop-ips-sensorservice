LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	BatteryService.cpp \
	CorrectedGyroSensor.cpp \
    Fusion.cpp \
    GravitySensor.cpp \
    LinearAccelerationSensor.cpp \
    OrientationSensor.cpp \
    RotationVectorSensor.cpp \
    SensorDevice.cpp \
    SensorFusion.cpp \
    SensorInterface.cpp \
    SensorCountMessages.proto \
    FirewallConfigMessages.proto \
    FirewallConfigUtils-inl.h \
    SensorPerturb.cpp \
    PrivacyRules.cpp \
    SensorService.cpp

LOCAL_CFLAGS:= -DLOG_TAG=\"SensorService\"

#LOCAL_CFLAGS += -fvisibility=hidden

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libhardware \
	libhardware_legacy \
	libutils \
	liblog \
	libbinder \
	libui \
	libgui \
	libstlport

LOCAL_MODULE:= libsensorservice

LOCAL_STATIC_LIBRARIES := \
	libprotobuf-cpp-2.3.0-lite \

LOCAL_C_INCLUDES := \
	bionic \
	bionic/libstdc++/include \
	external/stlport/stlport

include $(BUILD_SHARED_LIBRARY)

#####################################################################
# build executable
#include $(CLEAR_VARS)

#LOCAL_SRC_FILES:= \
#	main_sensorservice.cpp

#LOCAL_SHARED_LIBRARIES := \
#	libsensorservice \
#	libbinder \
#	libutils

#LOCAL_MODULE_TAGS := optional

#LOCAL_MODULE:= sensorservice

#include $(BUILD_EXECUTABLE)

# Build a host executable for creating firewall configs.
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	FirewallConfigMessages.proto \
	FirewallConfigUtils-inl.h \
	FirewallConfig.cpp \

LOCAL_CFLAGS:= -DLOG_TAG=\"SensorFirewall-Config\"

LOCAL_MODULE:= sensorfirewall-config

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libstlport \

LOCAL_STATIC_LIBRARIES := \
	libprotobuf-cpp-2.3.0-lite

LOCAL_C_INCLUDES := \
	bionic \
	bionic/libstdc++/include \
	external/stlport/stlport \

include $(BUILD_EXECUTABLE)
