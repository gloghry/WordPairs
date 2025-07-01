CC = clang
CFLAGS = -Wall -Wextra -Wpedantic -Werror -O3

SRC_DIR = src
BIN_DIR = bin

$(BIN_DIR):
	mkdir -p $@

SRCS = $(shell find $(SRC_DIR) -name '*.c')
OBJS = $(patsubst $(SRC_DIR)/%.c, $(BIN_DIR)/%.o, $(SRCS))

TARGET = $(BIN_DIR)/wordpairs

$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c | $(BIN_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

run: $(TARGET)
	$(TARGET) $(count) $(file1) $(file2) $(file3)

clean:
	rm -rf $(BIN_DIR)

.PHONY: clean run
