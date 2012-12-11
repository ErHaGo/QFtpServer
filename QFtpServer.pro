# Add files and directories to ship with the application 
# by adapting the examples below.
# file1.source = myfile
# dir1.source = mydir
DEPLOYMENTFOLDERS = # file1 dir1

symbian:TARGET.UID3 = 0xE6728FD6

# Smart Installer package's UID
# This UID is from the protected range 
# and therefore the package will fail to install if self-signed
# By default qmake uses the unprotected range value if unprotected UID is defined for the application
# and 0x2002CCCF value if protected UID is given to the application
#symbian:DEPLOYMENT.installer_header = 0x2002CCCF

# Allow network access on Symbian
symbian:TARGET.CAPABILITY += NetworkServices

# If your application uses the Qt Mobility libraries, uncomment
# the following lines and add the respective components to the 
# MOBILITY variable. 
# CONFIG += mobility
# MOBILITY +=

SOURCES += main.cpp mainwindow.cpp \
    ftpserver.cpp \
    ftpcontrolconnection.cpp \
    ftppassivedataconnection.cpp \
    asynchronousretrievecommand.cpp \
    asynchronousstorecommand.cpp
HEADERS += mainwindow.h \
    ftpserver.h \
    ftpcontrolconnection.h \
    ftppassivedataconnection.h \
    asynchronousretrievecommand.h \
    asynchronousstorecommand.h
FORMS += mainwindow.ui
QT += network

CONFIG(release, debug|release) {
    #This is a release build
    DEFINES += QT_NO_DEBUG_OUTPUT
} else {
    #This is a debug build
}

# Please do not modify the following two lines. Required for deployment.
include(deployment.pri)
qtcAddDeployment()
