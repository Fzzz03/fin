CC = g++
CFLAGS = -Wall -std=c++17
TARGET = main
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

all: $(TARGET)

$(TARGET): $(OBJ)
    $(CC) $(CFLAGS) -o $@ $(OBJ)

%.o: %.cpp
    $(CC) $(CFLAGS) -c $< -o $@

clean:
    rm -f $(TARGET) $(OBJ)
