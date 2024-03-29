TEMPLATE = app
TARGET = TaoQuickApp
QT += qml quick
CONFIG += plugin c++14 qtquickcompiler

include(../TaoVersion.pri)
#include(../TaoBundle.pri)

#msvc{
#    QMAKE_CFLAGS += -source-charset:utf-8
#    QMAKE_CXXFLAGS += -source-charset:utf-8
#}

#一部分头文件加入编译预处理，提高编译速度
CONFIG += precompile_header
PRECOMPILED_HEADER = Src/stdafx.h
precompile_header:!isEmpty(PRECOMPILED_HEADER) {
    DEFINES += USING_PCH
}

win32 {
    RC_FILE = App.rc
}
macos {
    ICON = milk.icns
}

CONFIG(debug,debug|release){
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../../bin/debug/)
    MOC_DIR = build/debug/moc
    RCC_DIR = build/debug/rcc
    UI_DIR = build/debug/ui
    OBJECTS_DIR = build/debug/obj
} else {
    DESTDIR = $$absolute_path($${_PRO_FILE_PWD_}/../../bin/release/)
    MOC_DIR = build/release/moc
    RCC_DIR = build/release/rcc
    UI_DIR = build/release/ui
    OBJECTS_DIR = build/release/obj
}

include(TaoQuickApp.pri)