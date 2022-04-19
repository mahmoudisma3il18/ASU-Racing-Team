#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include "communication_thread.h"

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(int RPM READ RPM WRITE setRPM NOTIFY RPMChanged)
    Q_PROPERTY(int gear READ gear WRITE setGear NOTIFY gearChanged)
    Q_PROPERTY(int battery READ battery WRITE setBattery NOTIFY batteryChanged)
    Q_PROPERTY(int oil READ oil WRITE setOil NOTIFY oilChanged)


public:
    explicit Controller(QObject *parent = nullptr);


    long speed();
    void setSpeed(int new_speed);
    long RPM();
    void setRPM(int new_RPM);
    long gear();
    void setGear(int new_gear);
    long battery();
    void setBattery(int new_battery);
    long oil();
    void setOil(int new_oil);


signals:
    void speedChanged(int);
    void RPMChanged(int);
    void gearChanged(int);
    void batteryChanged(int);
    void oilChanged(int);


private slots:
    void processMessage(const QString &s);
    void processError(const QString &s);
    void processTimeout(const QString &s);

private:

    CommunicationThread m_thread;
    long m_speed;
    long m_RPM;
    long m_gear;
    long m_battery;
    long m_oil;

};

#endif // CONTROLLER_H

