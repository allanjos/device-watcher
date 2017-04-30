/**
 * \author Allann Jones
 */

#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QDebug>
#include <QDir>
#include <QFileDialog>
#include <QMessageBox>

#include <iostream>

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    currentWatchPath = "";

    ui->setupUi(this);

    // Execution file path

    ui->labelExecutionPath->setText(qApp->applicationDirPath());

    // Enable filesytem watcher

    watcher = new QFileSystemWatcher(this);

    connect(watcher, SIGNAL(fileChanged(const QString &)), this, SLOT(fileChanged(const QString &)));
    connect(watcher, SIGNAL(directoryChanged(const QString &)), this, SLOT(directoryChanged(const QString &)));

    // Path to monitor

    //watcher->addPath(ui->lineEditDevEventsFile->text());
}

MainWindow::~MainWindow()
{
    MainWindow::unwatchPath();

    delete ui;

    delete watcher;
}

void MainWindow::directoryChanged(const QString& path)
{
    logText("DIR CHANGE: " + path);
}

void MainWindow::fileChanged(const QString& path)
{
    logText("FILE CHANGE: " + path);
}

void MainWindow::logText(const QString &str)
{
    ui->textEdit->setText(ui->textEdit->toPlainText()  + str + "\n");
}

void MainWindow::on_actionWatcherControl_triggered()
{
    // Unwatch if there is a watched path

    unwatchPath();

    // Path to monitor

    bool rv = watcher->addPath(ui->lineEditDevEventsFile->text());

    if (!rv) {
        logText("Error on trying to watch path: " + ui->lineEditDevEventsFile->text());
    }
    else {
        currentWatchPath = ui->lineEditDevEventsFile->text();

        logText("Watching path: " + ui->lineEditDevEventsFile->text());
    }
}

void MainWindow::unwatchPath()
{
    if (currentWatchPath.length() > 0) {
        logText("Unwatching path: " + currentWatchPath);

        watcher->removePath(currentWatchPath);
    }
}

void MainWindow::on_pushButton_clicked()
{
    QFileDialog dialog;

    if (ui->lineEditDevEventsFile->text().length() > 0) {
        QFileInfo fileInfo(ui->lineEditDevEventsFile->text());

        dialog.setDirectory(fileInfo.dir());
    }

    int result = dialog.exec();

    QString dirName = "";

    if (result) {
        dirName = dialog.selectedFiles()[0];

        qDebug() << dirName;
    }

    if (!dirName.isEmpty()) {
        ui->lineEditDevEventsFile->setText(dirName);
    }
}

void MainWindow::on_pushButton_2_clicked()
{
    QFileDialog dialog;

    dialog.setFileMode(QFileDialog::Directory);
    dialog.setOption(QFileDialog::ShowDirsOnly);

    if (ui->lineEditAdbDir->text().length() > 0) {
        dialog.setDirectory(ui->lineEditAdbDir->text());
    }

    int result = dialog.exec();

    QString dirName = "";

    if (result) {
        dirName = dialog.selectedFiles()[0];

        qDebug() << dirName;
    }

    if (!dirName.isEmpty()) {
        ui->lineEditAdbDir->setText(dirName);
    }
}
