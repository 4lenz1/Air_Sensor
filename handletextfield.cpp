#include "handletextfield.h"
#include <QSerialPort>

/*
 * This class handles interactions with the text field
 */
QSerialPort serial;
HandleTextField::HandleTextField(QObject *parent) :
    QObject(parent)
{
    mq4 = mq5 =  mq9 = "0";
    serialBuffer = "";
    qDebug () << "declear datareceie" ;
    serial.setPortName("COM5");

    serial.open(QIODevice::ReadWrite);
    serial.setBaudRate(QSerialPort::Baud9600);
    serial.setDataBits(QSerialPort::Data8);
    serial.setParity(QSerialPort::NoParity);
    serial.setStopBits(QSerialPort::OneStop);
    serial.setFlowControl(QSerialPort::HardwareControl);


    connect(&serial, SIGNAL(readyRead()) , this  , SLOT(getData()));
}

void HandleTextField::handleSubmitTextField(const QString &in)
{
    qDebug() << "c++: HandleTextField::handleSubmitTextField:" << in;
    //emit putData(in);
}
void HandleTextField::getData(){


    QStringList bufferList = serialBuffer.split(":");
    //qDebug() << bufferList;

    if (bufferList.at(0) == ""){
    //    qDebug() <<"mq4= "<< bufferList.at(0) << "adj mq4 to" << mq4 ;
        bufferList[0] = mq4;
    }else{
      //  qDebug() << "mq4 is correct :" << mq4 ;
        mq4 = bufferList.at(0);
    }
//    if(bufferList[1]==""){
//        bufferList[1] = mq5;
//    }
//    if(bufferList[2] ==""){
//        bufferList[2]= mq9;
//    }
    if(bufferList.length() < 4){
        serialData = serial.readAll();
        if(serialData != "")
            serialBuffer += QString::fromStdString(serialData.toStdString());

    }else{
        emit putMq4Data(bufferList[0]);
        emit putMq5Data(bufferList[1]);
        emit putMq9Data(bufferList[2]);
        serialBuffer.clear();
    }


//    qDebug() << "Mq4: " << bufferList[0];
//    qDebug() << "Mq5: " << bufferList[1];
//    qDebug() << "Mq9: " << bufferList[2];


   // qDebug() << str  ;
}
