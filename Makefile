UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	CFLAGS := -D_XOPEN_SOURCE -Wno-deprecated-declarations
endif

CC := gcc
NAME := hilolayex

BUILD=bin
UTILS_SUSE:= /home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse
LIBMUSE:= /home/utnso/workspace/tp-2019-2c-Los-Trapitos/libs/libMuse

all: clean $(NAME).so

clean:
	$(RM) *.o
	$(RM) *.so
	$(RM) -r bin/
	mkdir -p bin

$(NAME).o:
	$(CC) -c -Wall $(CFLAGS) -fpic hilolay_alumnos.c -o $(BUILD)/$(NAME).o -lhilolay -I$(UTILS_SUSE) -L$(UTILS_SUSE) -lutils_suse

$(NAME).so: $(NAME).o
	$(CC) -shared -o $(BUILD)/lib$(NAME).so $(BUILD)/$(NAME).o -lhilolay -I$(UTILS_SUSE) -L$(UTILS_SUSE) -lutils_suse

entrega:
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/archivo_de_swap_supermasivo archivo_de_swap_supermasivo.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/audiencia audiencia.c -l$(NAME) -lhilolay -lcommons -I$(UTILS_SUSE) -L$(UTILS_SUSE) -lutils_suse
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/caballeros_de_SisOp_Afinador caballeros_de_SisOp_Afinador.c -l$(NAME) -lhilolay -lcommons -I$(UTILS_SUSE) -L$(UTILS_SUSE) -lutils_suse
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/caballeros_de_SisOp_Solo caballeros_de_SisOp_Solo.c -l$(NAME) -lhilolay -lcommons -I$(UTILS_SUSE) -L$(UTILS_SUSE) -lutils_suse
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/estres_compartido estres_compartido.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/estres_privado estres_privado.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/recursiva recursiva.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/revolucion_compartida revolucion_compartida.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	$(CC) -L./$(BUILD)/ -Wall $(CFLAGS) -o $(BUILD)/revolucion_privada revolucion_privada.c -l$(NAME) -lhilolay -lcommons -lmuse -lutils_suse -I$(UTILS_SUSE) -L$(UTILS_SUSE) -L$(LIBMUSE)
	
archivo_de_swap_supermasivo:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/archivo_de_swap_supermasivo

audiencia:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/audiencia 

caballeros_de_SisOp_Afinador:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/caballeros_de_SisOp_Afinador

caballeros_de_SisOp_Solo:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/caballeros_de_SisOp_Solo

estres_compartido:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/estres_compartido

estres_privado:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/estres_privado

recursiva:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/recursiva

revolucion_compartida:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/revolucion_compartida

revolucion_privada:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):./$(BUILD):/home/utnso/workspace/tp-2019-2c-Los-Trapitos/utils_suse:$(LIBMUSE) ./$(BUILD)/revolucion_privada
