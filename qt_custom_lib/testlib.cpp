#include "testlib.h"

TestLib::TestLib()
{
}

int TestLib::foo()
{
    return QString("42").toInt();
}

void TestLib::set_str(char *str)
{
    TestLib::str = QString(str);
}

char* TestLib::get_str()
{
    std::string stdStr = TestLib::str.toStdString();
    char *str = new char[strlen(stdStr.c_str()) + 1];
    strcpy(str, stdStr.c_str());
    return str;
}

int TestLib::get_number()
{
    return TestLib::num;
}

void TestLib::set_number(int num)
{
    TestLib::num = num;
}

char* TestLib::get_version()
{    
    QString qtVersion = QString("Qt version: ") + QT_VERSION_STR;
    std::string stdVersion = qtVersion.toStdString();
    char *version = new char[strlen(stdVersion.c_str()) + 1];
    strcpy(version, stdVersion.c_str());
    return version;
}

unsigned char* TestLib::get_short_name()
{
    std::string src = "hello";
    unsigned char* str = new unsigned char [5];
    strcpy((char*)str, src.c_str());
    str[5] = '\0';
    return str;
}
