TOOLCHAIN_DIR = ./toolchain
TOOL_TXT_DIR = $(TOOLCHAIN_DIR)/msxx_txt
TOOL_FONTLIB_DIR = $(TOOLCHAIN_DIR)/msxx_fontlib
TXT = $(TOOL_TXT_DIR)/msxx_txt.py
FONT = $(TOOL_FONTLIB_DIR)/msxx_fontlib.py
ATLAS = $(TOOL_FONTLIB_DIR)/atlas_gen.py
BUILD_DIR = ./build

TXT_TARGET = $(BUILD_DIR)/TEXT_US.TXT
TXT_DIR = ./src/txt
TXT_SRC = $(TXT_DIR)/TEXT_CN.json

FONT_TARGET = $(BUILD_DIR)/FONT_LIB.BIN
FONT_DIR = ./src/fontlib
FONT_SRC = $(FONT_DIR)/proj.json

.PHONY : all clean
all : txt font

txt : $(TXT_TARGET)

$(TXT_TARGET) : $(TXT_SRC)
	$(TXT) $(TXT_SRC) json2txt -o $(TXT_TARGET)

font : $(FONT_TARGET)

$(FONT_TARGET) : FONT_SRC_ABS = $(shell realpath $(FONT_SRC))
$(FONT_TARGET) : ATLAS_ABS = $(shell realpath $(ATLAS))
$(FONT_TARGET) : FONT_ABS = $(shell realpath $(FONT))
$(FONT_TARGET) : $(FONT_SRC)
	( \
	cd $(BUILD_DIR) && \
	$(ATLAS_ABS) $(FONT_SRC_ABS) && \
	$(FONT_ABS) write \
	)

clean :
	rm ./$(BUILD_DIR)/* -f -v
