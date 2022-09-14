/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/


/**
 * @file
 *   @brief QGC Attitude Instrument
 *   @author Gus Grubba <gus@auterion.com>
 */

import QtQuick              2.3
import QtGraphicalEffects   1.0
import QtQuick.Controls 2.15

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

Item {
    id: root

    property bool showPitch:    true
    property var  vehicle:      null
    property real size
    property bool showHeading:  false

    property real _rollAngle:   vehicle ? vehicle.roll.rawValue  : 0
    property real _pitchAngle:  vehicle ? vehicle.pitch.rawValue : 0

    width:  size * 1.4
    height: size * 1.14
//////////
    Rectangle {
        id: fon
        anchors.centerIn: parent
        anchors.fill: parent
        color: qgcPal.window

        Image {
            id: avionika
            source: "/qmlimages/avionika.svg"
            anchors.top: parent.top
            transform: Scale {
                origin.x: 0
                origin.y: 0
                xScale: 0.1933
                yScale: 0.1933
            }
        }

        Button { // кнопка увеличения скорости самолета
            id: speedIncreaseButton
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 25
            text: qsTr("+")

            contentItem: Text {
                text: speedIncreaseButton.text
                color: qgcPal.text
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.bold: true
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                radius: implicitWidth / 2
                color: qgcPal.window
                border.width: 1
                border.color: qgcPal.text
            }
        }

        Rectangle { // граница квадрата
            id: borderSpeedInput
            width: 40
            height: 40
            radius: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.verticalCenter
            anchors.topMargin: - 20
            border.width: 1
            border.color: qgcPal.text
            color: qgcPal.window

            TextInput { // поле ввода скорости самолета
                id: speedInput
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                color: qgcPal.text
                font.pixelSize: 14
                width: parent.width - 3
                maximumLength: 3
                focus: true
                validator: IntValidator {
                    bottom: 0
                    top: 300
                }
            }
        }

        Button { // кнопка уменьшения скорости самолета
            id: speedReductionButton
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.verticalCenter
            anchors.topMargin: 25
            text: qsTr("-")

            contentItem: Text {
                text: speedReductionButton.text
                color: qgcPal.text
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.bold: true
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                radius: implicitWidth / 2
                color: qgcPal.window
                border.width: 1
                border.color: qgcPal.text
            }
        }

        Button { // кнопка увеличения высоты полета
            id: flightAltitudeIncreaseButton
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.bottom: parent.verticalCenter
            anchors.bottomMargin: 25
            text: qsTr("+")

            contentItem: Text {
                text: flightAltitudeIncreaseButton.text
                color: qgcPal.text
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.bold: true
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                radius: implicitWidth / 2
                color: qgcPal.window
                border.width: 1
                border.color: qgcPal.text
            }
        }

        Rectangle { // граница квадрата
            id: borderAltitudeInput
            width: 40
            height: 40
            radius: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: parent.verticalCenter
            anchors.topMargin: - 20
            border.width: 1
            border.color: qgcPal.text
            color: qgcPal.window

            TextInput { // поле ввода скорости самолета
                id: altitudeInput
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                color: qgcPal.text
                font.pixelSize: 14
                width: parent.width - 4
                maximumLength: 4
                focus: true
                validator: IntValidator {
                    bottom: 0
                    top: 5000
                }
            }
        }

        Button { // кнопка уменьшения высоты полета
            id: altitudeReductionButton
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.top: parent.verticalCenter
            anchors.topMargin: 25
            text: qsTr("-")

            contentItem: Text {
                text: altitudeReductionButton.text
                color: qgcPal.text
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                font.bold: true
            }

            background: Rectangle {
                implicitWidth: 40
                implicitHeight: 40
                radius: implicitWidth / 2
                color: qgcPal.window
                border.width: 1
                border.color: qgcPal.text
            }
        }
    }
//////////
    QGCPalette { id: qgcPal; colorGroupEnabled: enabled }

    Item {
        id:             instrument
        width: size * 0.9
        height: size * 0.9
//////////        anchors.fill:   parent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
///////////
        visible:        false

        //----------------------------------------------------
        //-- Искусственный горизонт
        QGCArtificialHorizon {
            rollAngle:          _rollAngle
            pitchAngle:         _pitchAngle
            anchors.fill:       parent
        }
        //----------------------------------------------------
        //-- Указатель
/*//////////        Image {
            id:                 pointer
            source:             "/qmlimages/attitudePointer.svg"
            mipmap:             true
            fillMode:           Image.PreserveAspectFit
            anchors.fill:       parent
            sourceSize.height:  parent.height
        } //////////*/
        //----------------------------------------------------
        //-- Циферблат прибора
        Image {
            id:                 instrumentDial
            source:             "/qmlimages/attitudeDial.svg"
            mipmap:             true
            fillMode:           Image.PreserveAspectFit
            anchors.fill:       parent
            sourceSize.height:  parent.height
            transform: Rotation {
                origin.x:       root.width  / 3.1
                origin.y:       root.height / 3.1
                angle:          -_rollAngle
            }
        }
        //----------------------------------------------------
        //-- шкала угла наклона


/*//////////        QGCPitchIndicator {
            id:                 pitchWidget
            visible:            root.showPitch
            size:               root.size * 0.5
            anchors.verticalCenter: parent.verticalCenter
            pitchAngle:         _pitchAngle
            rollAngle:          _rollAngle
            color:              Qt.rgba(0,0,0,0)
        } //////////*/
        //----------------------------------------------------
        //-- Перекрестие
        Image {
            id:                 crossHair
            anchors.centerIn:   parent
            source:             "/qmlimages/crossHair.svg"
            mipmap:             true
            width:              size * 0.75
            sourceSize.width:   width
            fillMode:           Image.PreserveAspectFit
        }
    }

    Rectangle {
        id:             mask
        anchors.fill:   instrument
//////////        radius:         width / 2
        color:          "black"
        visible:        false
    }

    OpacityMask {
        anchors.fill: instrument
        source: instrument
        maskSource: mask
    }

    Rectangle {
        id:             borderRect
        anchors.fill:   parent
//////////        radius:         width / 2
        color:          Qt.rgba(0,0,0,0)
        border.color:   qgcPal.text
        border.width:   1
    }

    QGCLabel {
        anchors.bottomMargin:       Math.round(ScreenTools.defaultFontPixelHeight * .75)
        anchors.bottom:             parent.bottom
        anchors.horizontalCenter:   parent.horizontalCenter
        text:                       _headingString3
        color:                      "white"
        visible:                    showHeading

        property string _headingString: vehicle ? vehicle.heading.rawValue.toFixed(0) : "OFF"
        property string _headingString2: _headingString.length === 1 ? "0" + _headingString : _headingString
        property string _headingString3: _headingString2.length === 2 ? "0" + _headingString2 : _headingString2
    }
}
