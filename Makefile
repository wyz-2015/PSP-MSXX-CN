TOOLCHAIN_DIR = ./toolchain
TOOL_TXT_DIR = $(TOOLCHAIN_DIR)/msxx_txt
TOOL_FONTLIB_DIR = $(TOOLCHAIN_DIR)/msxx_fontlib
export TXT = $(TOOL_TXT_DIR)/msxx_txt.py
export FONT = $(TOOL_FONTLIB_DIR)/msxx_fontlib.py
export ATLAS = $(TOOL_FONTLIB_DIR)/atlas_gen.py
BUILD_DIR = ./build

TXT_TARGET = TEXT_US.TXT
TXT_DIR = ./src/txt

FONT_TARGET = FONT_LIB.BIN
FONT_DIR = ./src/fontlib

.PHONY : all clean
all : txt font

txt :
	make -C $(TXT_DIR)/ TARGET=$(TXT_TARGET)
	mv $(TXT_DIR)/$(TXT_TARGET) $(BUILD_DIR)/ -v

font :
	make -C $(FONT_DIR)/ TARGET=$(FONT_TARGET)
	mv $(FONT_DIR)/$(FONT_TARGET) $(BUILD_DIR)/ -v

clean :
	make -C $(TXT_DIR) clean TARGET=$(TXT_TARGET)
	make -C $(FONT_DIR) clean TARGET=$(FONT_TARGET)
	rm ./$(BUILD_DIR)/* -f -v
