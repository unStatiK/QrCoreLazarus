#ifndef WRAPPER_H
#define WRAPPER_H

#include "testlib.h"

TESTLIBSHARED_EXPORT_C TestLib* new_instance();
TESTLIBSHARED_EXPORT_C int call_foo(TestLib* p);
TESTLIBSHARED_EXPORT_C int get_number(TestLib* p);
TESTLIBSHARED_EXPORT_C void set_number(TestLib* p, int num);
TESTLIBSHARED_EXPORT_C char* get_str(TestLib* p);
TESTLIBSHARED_EXPORT_C void set_str(TestLib* p, char* str);
TESTLIBSHARED_EXPORT_C char* get_version(TestLib* p);
TESTLIBSHARED_EXPORT_C unsigned char* get_short_name(TestLib* p);

TESTLIBSHARED_EXPORT_C char* get_hello_str();

#endif // WRAPPER_H
