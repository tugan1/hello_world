
CC=g++
CFLAGS += -c -Wall
CFLAGS += -O3
CFLAGS += -std=c++14
CFLAGS += -U__STRICT_ANSI__
CFLAGS += -Wno-maybe-uninitialized 
CFLAGS += -Wno-unknown-pragmas
CFLAGS += -fopenmp
LDFLAGS += -fopenmp
LDFLAGS += -static-libgcc
LDFLAGS += -static-libstdc++

#LDFLAGS +=-static

SRCDIR := src
BUILDDIR := build
BINDIR := bin
INCLUDEDIR := include


#$(info 2)
SYS := $(shell gcc -dumpmachine)
#$(info 3)
ifeq (i686,$(findstring i686, $(SYS)))
	ARCH = x86_i686
	BITS = 32
else ifeq (i386,$(findstring i386, $(SYS)))
	ARCH = x86_i386
	BITS = 32
else ifeq (arm,$(findstring arm, $(SYS)))
	ARCH = arm
	BITS = 32
else ifeq (x86_64,$(findstring x86_64, $(SYS)))
	ARCH = x86_64
	BITS = 64
else
	ARCH = UNKOWN
	BITS = UNKOWN
endif
#$(info 4)
ifeq (mingw,$(findstring mingw, $(SYS)))
	DELETE = del
	NULDEVICE = nul
	MAKEDIR = mkdir
	DELETE_COMMAND := $(DELETE) $(BUILDDIR)\*.o
	DELETE_COMMAND += $(BINDIR)\*.exe
	#OS is already defined in Windows
	date =  $(shell date /t) 
	date += $(shell time /t)
	COPY = xcopy
else
	OS = $(shell uname -s)
	DELETE = rm
	NULDEVICE = /dev/null
	MAKEDIR = mkdir -p
	DELETE_COMMAND := $(DELETE) $(BUILDDIR)/*.o
	DELETE_COMMAND += $(BINDIR)/*.exe
	date = $(shell date +'%F %T')

endif


$(info MAKEFILE: ${date} Detected OS = ${OS}, Architechure = ${ARCH} ${BITS}bit, Compiler = ${SYS})

SRCEXT := cpp

TARGET := $(BINDIR)/main.exe
SOURCES := $(wildcard $(SRCDIR)/*.cpp)
OBJECTS := $(addprefix $(BUILDDIR)/,$(notdir $(SOURCES:.cpp=.o)))
	

$(shell $(MAKEDIR) $(BUILDDIR) 1>$(NULDEVICE) 2>&1)

INC := -I $(INCLUDEDIR)

$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $(TARGET) $(LIB)

$(BUILDDIR)/%.o: $(SRCDIR)/%.$(SRCEXT)
	$(CC) $(CFLAGS) $(INC) -c -o $@ $<

clean:
	$(shell $(DELETE_COMMAND))
	
