PROJ = ./proj.json

.PHONY : all clean
all : $(TARGET)

$(TARGET) : $(SRC)
	$(ATLAS) $(PROJ)
	$(FONT) write

clean :
	rm $(TARGET) -f -v
	rm ./page* ./Makefile.json -v -f
