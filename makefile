##################################
# @brief:make scripts
# @date:2016.05.28
# @author:dablelv
##################################

#environment var
VPATH+=.

CC:=g++
FLAGS=-g -Wall -std=c++11
INC+=-I/usr/local/mysql/include
LIBDIR+=-L/usr/local/mysql/lib

CPPDIRS=.
CPPS=$(shell for dir in ${CPPDIRS};do echo $${dir}/*.cpp;done)

OBJDIR=obj
OBJS=$(patsubst %.cpp,${OBJDIR}/%.o,$(notdir ${CPPS}))

TARGET:=mysqlDemo.out

${TARGET}:${OBJS}
	${CC} ${FLAGS} ${OBJS} -o $@ ${LIBDIR} -lmysqlclient
	
${OBJDIR}/%.o:./%.cpp
	${CC} ${FLAGS} ${INC} -o $@ -c $<

.PHONY:clean
clean:
	rm -f ${TARGET} ${OBJDIR}/*

