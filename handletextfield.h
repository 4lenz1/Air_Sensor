#ifndef HANDLETEXTFIELD_H
#define HANDLETEXTFIELD_H

#include <QObject>
#include <QDebug>
#include <QSerialPort>

class HandleTextField : public QObject
{
    Q_OBJECT
public:
    explicit HandleTextField(QObject *parent = 0);

signals:
    void putMq4Data(QVariant data);
    void putMq5Data(QVariant data);
    void putMq9Data(QVariant data);

public slots:
    void getData();
    void handleSubmitTextField(const QString& in);

private:
    QByteArray serialData;
    QString serialBuffer;
    QString mq4 , mq5 , mq9;
};

#endif // HANDLETEXTFIELD_H
