#-------------------------------------------------
#
# Project created by QtCreator 2021-05-26T03:39:53
#
#-------------------------------------------------

QT -= gui

TARGET = tinyUserLib
TEMPLATE = lib

DEFINES += TESTLIB_LIBRARY

SOURCES += testlib.cpp \
    wrapper.cpp

HEADERS += testlib.h\
        testlib_global.h \
    wrapper.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
