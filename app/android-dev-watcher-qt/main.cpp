/**
 * \author Allann Jones
 */

#include "mainwindow.h"
#include <QApplication>

#include <QWidget>
#include <QMessageBox>
#include <QFileSystemWatcher>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    MainWindow w;

    w.show();

    return a.exec();
}
