######################################
# target
######################################
TARGET = hc32l110c6ua

#__HC32L110C__ or __HC32L110B__ 
TARGET_DEFS = -D__HC32L110C__

# for x4, use driver/ld/hc32l110x4.ld
TARGET_LD_SCRIPT = driver/ld/hc32l110x6.ld

USER_SOURCES = blink/main.c
USER_INCLUDES = -Iblink 

######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization for size
OPT = -Os


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES = \
driver/src/ddl.c \
driver/src/lvd.c \
driver/src/clk.c \
driver/src/adt.c \
driver/src/reset.c \
driver/src/crc.c \
driver/src/i2c.c \
driver/src/lpt.c \
driver/src/vc.c \
driver/src/adc.c \
driver/src/spi.c \
driver/src/pca.c \
driver/src/lpuart.c \
driver/src/wdt.c \
driver/src/interrupts_hc32l110.c \
driver/src/trim.c \
driver/src/uart.c \
driver/src/bt.c \
driver/src/flash.c \
driver/src/rtc.c \
driver/src/gpio.c \
driver/src/lpm.c \
mcu/common/system_hc32l110.c \
$(USER_SOURCES)

# ASM sources
ASM_SOURCES =  driver/startup/startup_hc32l110.S


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-

CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size

HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S

#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m0plus

# fpu
# NONE for Cortex-M0/M0+/M3

# float-abi

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

AS_DEFS =

# C defines
C_DEFS = $(TARGET_DEFS) 

# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-Idriver/inc \
-Imcu/common \
-Idriver/cmsis/CM0/Core \
$(USER_INCLUDES) 

# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = $(TARGET_LD_SCRIPT)

# libraries
LIBS = -lc -lm -lnosys
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,--no-warn-rwx-segments -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))

# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.S=.o)))
vpath %.S $(sort $(dir $(ASM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR)
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@
#$(LUAOBJECTS) $(OBJECTS)
$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# program
#######################################
program_pyocd:
	pyocd erase -c -t hc32l110 --config pyocd.yaml
	pyocd load build/$(TARGET).hex -t hc32l110 --config pyocd.yaml

program_openocd:
	openocd -f /usr/share/openocd/scripts/interface/cmsis-dap.cfg -f /usr/share/openocd/scripts/target/hc32l110.cfg -c "program build/$(TARGET).hex verify reset exit" 

#######################################
# debug
#######################################
debug_pyocd:
	pyocd-gdbserver -t hc32l110 --config pyocd.yaml

debug_openocd:
	openocd -f /usr/share/openocd/scripts/interface/cmsis-dap.cfg -f /usr/share/openocd/scripts/target/hc32l110.cfg 


#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
