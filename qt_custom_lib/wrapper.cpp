#include "wrapper.h"

TESTLIBSHARED_EXPORT_C TestLib* new_instance()
{
    return new TestLib;
}

TESTLIBSHARED_EXPORT_C int call_foo(TestLib* p)
{
    return p->foo();
}

TESTLIBSHARED_EXPORT_C int get_number(TestLib* p)
{
    return p->get_number();
}

TESTLIBSHARED_EXPORT_C void set_number(TestLib* p, int num)
{
    p->set_number(num);
}

TESTLIBSHARED_EXPORT_C char* get_str(TestLib* p)
{
    return p->get_str();
}

TESTLIBSHARED_EXPORT_C void set_str(TestLib* p, char* str)
{
    p->set_str(str);
}



TESTLIBSHARED_EXPORT_C char* get_version(TestLib* p)
{
    return p->get_version();
}

TESTLIBSHARED_EXPORT_C unsigned char* get_short_name(TestLib* p)
{
    return p->get_short_name();
}


TESTLIBSHARED_EXPORT_C char* get_hello_str()
{
    return "Hello from the library!";
}
