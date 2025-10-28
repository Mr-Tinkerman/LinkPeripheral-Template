# ======== Configuration ========

TARGET_BINARIES := TMPLT
TMPLT_REALNAME := template



# ======== Host System Detection ========
HOST_OS    := $(if $(filter Win%, ${OS}),WIN32, $(if $(filter Linux%, $(shell uname -s)),LINUX,$(if $(filter Darwin%, $(shell uname -s)),OSX),NULL_OS))

__PROC_GET := $(if $(filter WIN32, ${HOST_OS}),${PROCESSOR_ARCHITECTURE}${PROCESSOR_ARCHITEW6432},$(shell uname -p))
__IS_ARM   := $(if $(filter arm% ARM%, ${__PROC_GET}),ARM)

HOST_ARCH  := $(if $(filter %32 %64 %64T, ${__PROC_GET}),$(if ${__IS_ARM},ARM,x)$(if $(filter %64 %64T, ${__PROC_GET}),64,$(if ${__IS_ARM},32,86)),NULL_ARCH)

HOST_MACHINE := ${HOST_OS}, ${HOST_ARCH}

all:
	@echo ${HOST_MACHINE}
