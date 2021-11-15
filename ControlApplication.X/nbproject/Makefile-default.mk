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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=main.c ../Serial_HAL.X/Serial_HAL.c ../Timer_HAL.X/Timer_HAL.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o ${OBJECTDIR}/_ext/970905652/Timer_HAL.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d ${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o ${OBJECTDIR}/_ext/970905652/Timer_HAL.o

# Source Files
SOURCEFILES=main.c ../Serial_HAL.X/Serial_HAL.c ../Timer_HAL.X/Timer_HAL.c

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
ProjectDir="D:\Documents\Courses\Ser Inge\Embebidos\Control-Aplicado-Seringe\ControlApplication.X"
ProjectName=ControlApplication
ConfName=default
ImagePath="dist\default\${IMAGE_TYPE}\ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ImageDir="dist\default\${IMAGE_TYPE}"
ImageName="ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}"
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IsDebug="true"
else
IsDebug="false"
endif

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
	@echo "--------------------------------------"
	@echo "User defined post-build step: ["C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.exe" -C "C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.conf" -p m328p -c arduino -P COM4 -b 57600 -U flash:w:$(ImagePath) -D -V]"
	@"C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.exe" -C "C:\Program Files\Microchip\MPLABX\v5.45\mplab_platform\bin\avrdude.conf" -p m328p -c arduino -P COM4 -b 57600 -U flash:w:$(ImagePath) -D -V
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
${OBJECTDIR}/main.o: main.c  .generated_files/a2053f59a12c3e58359554332794273f6beee27f.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/_ext/1366082143/Serial_HAL.o: ../Serial_HAL.X/Serial_HAL.c  .generated_files/9e03455dbe6142cdc7fe81cc0241628f3ee48c04.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1366082143" 
	@${RM} ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d" -MT "${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d" -MT ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o  -o ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o ../Serial_HAL.X/Serial_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/_ext/970905652/Timer_HAL.o: ../Timer_HAL.X/Timer_HAL.c  .generated_files/d5ee13a92251ed4d9ccc6a33bbf0825925e6fd43.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}/_ext/970905652" 
	@${RM} ${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/970905652/Timer_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d" -MT "${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d" -MT ${OBJECTDIR}/_ext/970905652/Timer_HAL.o  -o ${OBJECTDIR}/_ext/970905652/Timer_HAL.o ../Timer_HAL.X/Timer_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
else
${OBJECTDIR}/main.o: main.c  .generated_files/d9b4401bc896965f689e857aa1f86ed9658787f4.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/_ext/1366082143/Serial_HAL.o: ../Serial_HAL.X/Serial_HAL.c  .generated_files/65f89e24e95c0268eb531d06db733e823cad812.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1366082143" 
	@${RM} ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d" -MT "${OBJECTDIR}/_ext/1366082143/Serial_HAL.o.d" -MT ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o  -o ${OBJECTDIR}/_ext/1366082143/Serial_HAL.o ../Serial_HAL.X/Serial_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
${OBJECTDIR}/_ext/970905652/Timer_HAL.o: ../Timer_HAL.X/Timer_HAL.c  .generated_files/e6b039bada7d2e6d993da5980366346040f48992.flag .generated_files/6a919784f3eb6c2d300f40ba34f5a9cdb50801f5.flag
	@${MKDIR} "${OBJECTDIR}/_ext/970905652" 
	@${RM} ${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d 
	@${RM} ${OBJECTDIR}/_ext/970905652/Timer_HAL.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=atmega328p ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d" -MT "${OBJECTDIR}/_ext/970905652/Timer_HAL.o.d" -MT ${OBJECTDIR}/_ext/970905652/Timer_HAL.o  -o ${OBJECTDIR}/_ext/970905652/Timer_HAL.o ../Timer_HAL.X/Timer_HAL.c  -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -DF_CPU=16000000
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__MPLAB_DEBUGGER_SIMULATOR=1 -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\ControlApplication.X.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=atmega328p ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="dist\${CND_CONF}\${IMAGE_TYPE}\ControlApplication.X.${IMAGE_TYPE}.map"    -o dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_default=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "dist/${CND_CONF}/${IMAGE_TYPE}/ControlApplication.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
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
