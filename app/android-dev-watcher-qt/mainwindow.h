/**
 * \author Allann Jones
 */

#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QFileSystemWatcher>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:

  void directoryChanged(const QString & path);
  void fileChanged(const QString & path);

  void on_actionWatcherControl_triggered();

  void on_pushButton_clicked();

  void on_pushButton_2_clicked();

  void on_pushButtonApkPath_clicked();

private:
    Ui::MainWindow *ui;

    QFileSystemWatcher *watcher;

    void logText(const QString &str);

    QString currentWatchPath;

    void unwatchPath();
};

#endif // MAINWINDOW_H
