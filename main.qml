import QtQuick 2.0
import QtQuick.Window 2.15
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Extras.Private 1.0
import QtQuick.Shapes 1.15

Window {
    width: 1500
    height: 1000
    visible: true
    color: "#080303"
    title: qsTr("ASU Racing Team")


    /***************************************************************************
      ***************************************************************************/

    FontLoader{ id:digitalFont;name: DS-Digital}

    /***************************************************************************
      ***************************************************************************/

    Text {
        id: text1
        height: 60
        color: "#d94040"
        text: qsTr("ASU Racing Team")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 50
        horizontalAlignment: Text.AlignHCenter
        anchors.rightMargin: 450
        anchors.leftMargin: 450
        anchors.topMargin: 85
        font.styleName: "Bold Italic"
        font.family: "Verdana"
    }


    /*****************************************************************************************************
      ***************************************************************************************************/

    CircularGauge{

        id: gauge1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        smooth: true
        anchors.topMargin: 450
        anchors.bottomMargin: 180
        anchors.leftMargin: 950
        anchors.rightMargin: 155
        maximumValue: 15
        stepSize: 0
        value:((controller.RPM/1000))
        style: CircularGaugeStyle
        {
            id: style1
            tickmarkStepSize: 1
            labelStepSize: 1

            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.85
                antialiasing: true
                color:gauge1.value>=9 ?"#B92013":"#83E322"
            }


            foreground: Item {
                Rectangle {
                    width: outerRadius * 0.2
                    height: width
                    radius: width / 2
                    color: gauge1.value>=9 ?"#650801":"#349A0A"
                    anchors.centerIn: parent
                }
            }

            tickmarkLabel:  Text {
                font.pixelSize: Math.max(6, outerRadius * 0.15)
                text: styleData.value
                color: styleData.value >= 9 ? "#e34c22" : "#83E322"
                antialiasing: true
            }

            tickmark: Rectangle {
                visible: styleData.value < 9 || styleData.value % 1 == 0
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.06
                color: styleData.value >= 9 ? "#e34c22" : "#83E322"
            }

            minorTickmark: Rectangle {
                visible: styleData.value < 12
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.03
                color: styleData.value >= 9 ? "#e34c22" : "#e5e5e5"
            }



            background: Canvas {
                onPaint: {
                   var ctx = getContext("2d");
                       ctx.reset();

                       ctx.beginPath();
                       ctx.strokeStyle = "#e34c22";
                       ctx.lineWidth = outerRadius * 0.02;

                       ctx.arc(outerRadius, outerRadius, outerRadius - ctx.lineWidth / 2,
                           -0.05,Math.PI * 0.305, false);
                        ctx.stroke();
                  }
             }
        }

        Text {
            id: text2
            color: "#C1D9C6"
            text: "x1000/min"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 22
            horizontalAlignment: Text.AlignHCenter
            font.styleName: "Bold"
            font.family: "Verdana"
            anchors.rightMargin: 147
            anchors.leftMargin: 147
            anchors.bottomMargin: 70
            anchors.topMargin: 273
        }

    }

    Text {
        id: text3
        color: "#63daea"
        text: controller.RPM
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 55
        horizontalAlignment: Text.AlignHCenter
        anchors.rightMargin: 278
        anchors.leftMargin: 1073
        anchors.bottomMargin: 171
        anchors.topMargin: 776
        font.italic: false
        font.bold: true
        font.family: "DS-Digital"
    }

    /***************************************************************************************************
      *************************************************************************************************/


    CircularGauge {
        id: gauge
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        smooth: true
        anchors.leftMargin: 155
        anchors.rightMargin: 950
        anchors.bottomMargin: 180
        anchors.topMargin: 450
        maximumValue: 160
        value:controller.speed

          style: CircularGaugeStyle {
              id: style

              tickmark: Rectangle {
                  visible:  styleData.value % 10 == 0
                  implicitWidth: outerRadius * 0.02
                  antialiasing: true
                  implicitHeight: outerRadius * 0.06
                  color: "#83E322"
              }

              minorTickmark: Rectangle {
                  visible: true
                  implicitWidth: outerRadius * 0.01
                  antialiasing: true
                  implicitHeight: outerRadius * 0.03
                  color: "#e5e5e5"
              }

              tickmarkLabel:  Text {
                  font.pixelSize: Math.max(6, outerRadius * 0.12)
                  font.bold: true
                  text: styleData.value
                  color: "#e5e5e5"
                  antialiasing: true
              }

              needle: Rectangle {
                  y: outerRadius * 0.15
                  implicitWidth: outerRadius * 0.03
                  implicitHeight: outerRadius * 0.85
                  antialiasing: true
                  color: "#83E322"
              }

              foreground: Item {
                  Rectangle {
                      width: outerRadius * 0.2
                      height: width
                      radius: width / 2
                      color: "#349A0A"
                      anchors.centerIn: parent
                  }
              }
          }

          Text {
              id: text4
              color: "#C1D9C6"
              text: "km/h"
              anchors.left: parent.left
              anchors.right: parent.right
              anchors.top: parent.top
              anchors.bottom: parent.bottom
              font.pixelSize: 22
              horizontalAlignment: Text.AlignHCenter
              font.styleName: "Bold"
              font.family: "Verdana"
              anchors.rightMargin: 147
              anchors.leftMargin: 147
              anchors.bottomMargin: 70
              anchors.topMargin: 273
          }
      }

    Text {
        id: text5
        color: "#63daea"
        text: controller.speed
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 55
        horizontalAlignment: Text.AlignHCenter
        anchors.leftMargin: 278
        anchors.rightMargin: 1073
        anchors.bottomMargin: 171
        anchors.topMargin: 776
        font.italic: false
        font.bold: true
        font.family: "DS-Digital"
    }


    /***************************************************************************************************
      *************************************************************************************************/


    Canvas {
        id: root
        y: 420
        width: 400
        height: 400
        opacity: 1
        anchors.horizontalCenter: parent.horizontalCenter
        // canvas size
        // handler to override for drawing
        onPaint: {
            // get context to draw with
            var ctx = getContext("2d")
            // setup the stroke
            ctx.lineWidth = 4
            ctx.strokeStyle = "#581845"
            // setup the fill
            ctx.fillStyle = "#E5DFC6"
            // begin a new path to draw
            ctx.beginPath()
            // top-left start point
            ctx.moveTo(20,0)
            // upper line
            ctx.lineTo(380,0)
            // right line
            ctx.lineTo(380,300)
            // bottom line
            ctx.lineTo(20,300)
            // left line through path closing
            ctx.closePath()
            // fill using fill style
            ctx.fill()
            // stroke using line width and stroke style
            ctx.stroke()
        }

        Text {
            id: text6
            color: "#ff0000"
            text: qsTr("Warnings")
            anchors.top: parent.top
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.family: "Verdana"
            anchors.horizontalCenterOffset: 1
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: image1
            x: 78
            y: 92
            width: 100
            height: 100
            source: "Images/mmm.png"
            fillMode: Image.PreserveAspectFit
            visible: (controller.battery ===1)? true : false
        }

        Image {
            id: image2
            x: 213
            y: 85
            width: 112
            height: 107
            source: "Images/Capture-removebg-preview.png"
            fillMode: Image.PreserveAspectFit
            visible: (controller.battery ===1)? true : false
        }
    }


    Image {
        id: image
        width: 100
        height: 100
        anchors.left: parent.left
        anchors.top: parent.top
        source: "Images/52qaM5t-_400x400-removebg-preview.png"
        anchors.leftMargin: 120
        anchors.topMargin: 65
        fillMode: Image.PreserveAspectFit
    }

    TextInput {
        id: textInput
        width: 767
        color: "#f9f9f9"
        text: qsTr("DRIVER NAME : MAHMOUD ISAMIL SAMY METWALY")
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 40
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 673
        anchors.topMargin: 287
        font.family: "DS-Digital"
    }

    Text {
        id: text8
        y: 856
        color: "#0091ff"
        text: qsTr("GEAR")
        font.pixelSize: 30
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        font.styleName: "Bold"
        font.family: "Tahoma"
        font.bold: true
    }

    Text {
        id: text9
        y: 776
        width: 95
        height: 60
        color: "#b5cee0"
        text: controller.gear === 0 ? "R":(controller.gear === 1 ? "N": (controller.gear - 1))
        font.pixelSize: 60
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "DS-Digital"
    }







}
