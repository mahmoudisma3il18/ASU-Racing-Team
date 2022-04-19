#include "controller.h"


Controller::Controller(QObject *parent)
    : QObject(parent), m_speed(0),m_RPM(0),m_gear(0),m_battery(0)
{
    connect(&m_thread, &CommunicationThread::message, this, &Controller::processMessage);
    connect(&m_thread, &CommunicationThread::error, this, &Controller::processError);
    connect(&m_thread, &CommunicationThread::timeout, this, &Controller::processTimeout);

    m_thread.start( 10000000);
}


long Controller::speed()
{
    return m_speed;
}

long Controller::RPM()
{
    return m_RPM;
}

long Controller::gear()
{
    return m_gear;
}

long Controller::battery()
{

    return m_battery;
}

long Controller :: oil()
{
    return m_oil;
}

void Controller::setGear(int new_gear)
{
    m_gear=new_gear;
    emit gearChanged(new_gear);
}

void Controller::setSpeed(int  new_speed)
{
    m_speed = new_speed;
    emit speedChanged(new_speed);
}

void Controller::setRPM(int new_RPM)
{
    m_RPM=new_RPM;
    emit RPMChanged(new_RPM);
}

void Controller :: setBattery(int new_battery)
{
    m_battery=new_battery;
    emit batteryChanged(new_battery);
}

void Controller :: setOil(int new_oil)
{
    m_oil = new_oil;
    emit oilChanged(new_oil);
}



void Controller::processMessage(const QString &s)
{
    long Speed = 0;
    long RPM = 0;
    long gear=0;
    long battery=0;
    long oil = 0;
    long ID=((s.toULong()) & 0xFFFF0000) >> 16;
    long MSG=s.toULong() ;

    switch(ID)
    {
    case 1 :
        Speed=(MSG&(0x0000FFFF));
        setSpeed(Speed);
        break;

    case 2 :
        RPM = (MSG&(0x0000FFFF));
        setRPM(RPM);
        break;

    case 3 :
        gear = (MSG&(0x0000FFFF));
        setGear(gear);
        break;

    case 4 :
        battery = (MSG&(0x0000FFFF));
        setBattery(battery);
        break;

    case 5 :
        oil = (MSG&(0x0000FFFF));
        setOil(oil);
        break;


    }


}

void Controller::processError(const QString &s)
{
}

void Controller::processTimeout(const QString &s)
{
}
