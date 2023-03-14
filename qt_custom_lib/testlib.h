#ifndef TESTLIB_H
#define TESTLIB_H

#include "testlib_global.h"
#include <QString>
#include <QtGlobal>

class TESTLIBSHARED_EXPORT TestLib
{

public:
    TestLib();
    qint32 num;
    QString str;
    int foo();
    void set_number(int num);
    int get_number();
    void set_str(char* str);
    char* get_str();
    char* get_version();
    unsigned char* get_short_name();
};

#endif // TESTLIB_H
