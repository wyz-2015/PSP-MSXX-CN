# TARGET = TEXT_US.TXT
SRC = ./TEXT_CN.json

.PHONY : all clean
all : $(TARGET)

$(TARGET) : $(SRC)
	$(TXT) $(SRC) json2txt -o $(TARGET)

clean :
	rm $(TARGET) -f -v
