# Compilador e flags
CXX = g++
CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude -fPIC

# Diretórios
SRC_DIR = src
BIN_DIR = bin

# Detecta todos os arquivos .cpp em src
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%.o,$(SRC_FILES))

# Nomes dos binários
TARGET = $(BIN_DIR)/app
STATIC_LIB = $(BIN_DIR)/libbib.a
SHARED_LIB = $(BIN_DIR)/libbib.so

# Regras principais
.PHONY: all clean teste

all: dirs $(TARGET) $(STATIC_LIB) $(SHARED_LIB)

# Cria a pasta bin se não existir
dirs:
	@mkdir -p $(BIN_DIR)

# Compila .cpp em .o
$(BIN_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Gera executável
$(TARGET): $(OBJ_FILES)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Biblioteca estática (.a)
$(STATIC_LIB): $(OBJ_FILES)
	ar rcs $@ $^

# Biblioteca compartilhada (.so)
$(SHARED_LIB): $(OBJ_FILES)
	$(CXX) -shared $^ -o $@

# Limpar binários
clean:
	rm -rf $(BIN_DIR)/*.o $(BIN_DIR)/app $(BIN_DIR)/*.a $(BIN_DIR)/*.so

# Rodar programa principal
run: all
	./$(TARGET)
