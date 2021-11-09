#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.c Serial_HAL.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/Serial_HAL.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/Serial_HAL.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/Serial_HAL.o

# Source Files
SOURCEFILES=main.c Serial_HAL.c

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/atmega328p"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

# The following macros may be used in the pre and post step lines
Device=ATmega328P
ProjectDir="E:\Documentos\Courses\Control-Aplicado-Seringe\Serial_HAL.X"
ProjectName=Serial_HAL
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: ["C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.exe" -C "C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.conf" -p m328p -c arduino -P COM9 -b 57600 -U flash:w:$(ImagePath) -D -V]"
	@"C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.exe" -C "C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.conf" -p m328p -c arduino -P COM9 -b 57600 -U flash:w:$(ImagePath) -D -V
	@echo "--------------------------------------"

MP_PROCESSOR_OPTION=ATmega328P
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.c  .generated_files/b4952f35da5cf70ec57ab9b049311d2f63175050.flag .generated_files/3c6ce705964a09bc088970466ec0715524ad6b4a.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/Serial_HAL.o: Serial_HAL.c  .generated_files/c6ce36badc753469eb39c05b7be7c59084164a34.flag .generated_files/3c6ce705964a09bc088970466ec0715524ad6b4a.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Serial_HAL.o.d 
	@${RM} ${OBJECTDIR}/Serial_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Serial_HAL.o.d" -MT "${OBJECTDIR}/Serial_HAL.o.d" -MT ${OBJECTDIR}/Serial_HAL.o  -o ${OBJECTDIR}/Serial_HAL.o Serial_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/c0762dc367c261fb7c0b672f9aebc9b533ee0b99.flag .generated_files/3c6ce705964a09bc088970466ec0715524ad6b4a.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/Serial_HAL.o: Serial_HAL.c  .generated_files/23ef51297f7d7b5051a6c2273d6ca022901c5e59.flag .generated_files/3c6ce705964a09bc088970466ec0715524ad6b4a.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Serial_HAL.o.d 
	@${RM} ${OBJECTDIR}/Serial_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/Serial_HAL.o.d" -MT "${OBJECTDIR}/Serial_HAL.o.d" -MT ${OBJECTDIR}/Serial_HAL.o  -o ${OBJECTDIR}/Serial_HAL.o Serial_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\Serial_HAL.X.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\Serial_HAL.X.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/Serial_HAL.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
