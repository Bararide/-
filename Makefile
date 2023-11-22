CC = g++
CFLAGS  = -I/usr/include/boost
GLPATH  = -I/usr/include/opengl/headers
GLMPATH = -I/usr/include/glm/headers

VERSION = -std=c++20

GLMLIBS = -L/usr/include/glm/libs

LDFLAGS  = -lboost_system -lboost_program_options
GLFLAGS  = -lGL -lGLU -lglut
GLMFLAGS = -lglm


SRCS := $(wildcard *.cpp)
HDRS := $(wildcard *.h)

all: boost, opengl, boogl, glm, classic

classic: $(SRCS) $(HDRS) 
	$(CC) $(VERSION) -o $@ $(SRCS)

boost: $(SRCS) $(HDRS)
	$(CC) $(VERSION) $(CFLAGS) $(LDFLAGS) -o $@ $(SRCS)

opengl: $(SRCS) $(HDRS)
	$(CC) $(VERSION) $(GLPATH) $(GLFLAGS) -o $@ $(SRCS)

boogl: $(SRCS) $(HDRS)
	$(CC) $(VERSION) $(GLPATH) $(GLFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $(SRCS)

glm: $(SRCS) $(HDRS)
	$(CC) $(VERSION) $(GLMPATH) $(GLMLIBS) $(GLMLFLAGS) -o $@ $(SRCS)

clean:
	rm -f all