import QtQuick 2.0
import QtQuick.Controls         2.4

import QGroundControl                       1.0
import QGroundControl.Controls              1.0
import QGroundControl.MultiVehicleManager   1.0
import QGroundControl.ScreenTools           1.0
import QGroundControl.Palette               1.0

Item {
    id: _indicators
    anchors.bottom: attitude.top
    anchors.left: attitude.left
    anchors.right: attitude.right
    height: 45

/*//////////        Rectangle {
        id: _connect
        height: 40
        width: 40
        radius: height / 2
        color: "blue"
        border.color: "white"
        border.width: 1

        Image {
            source: "/qmlimages/antenna.svg"
            anchors.centerIn: parent
            scale: 0.06
        }

    } //////////*/

    property string _commLostText:      qsTr("Communication Lost") /// Связь потеряна
    property string _readyToFlyText:    qsTr("Ready To Fly")       /// Готов к полету
    property string _notReadyToFlyText: qsTr("Not Ready")          /// Не готов
    property string _disconnectedText:  qsTr("Disconnected")       /// Отключено
    property string _armedText:         qsTr("Armed")              /// Снаряжен
    property string _flyingText:        qsTr("Flying")             /// Летает
    property string _landingText:       qsTr("Landing")            /// Посадка

    function fStatusSource() {

        if (_activeVehicle) {
            if (_communicationLost) {
//////////                statusSource = "/qmlimages/antenna-red.svg"
//////////                icon.source = "/qmlimages/antenna-red.svg"
                console.log("_communicationLost")
                return _connect.icon.source = "/qmlimages/antenna-red.svg"
            }
            if (_activeVehicle.armed) {
//////////                statusSource = "/qmlimages/antenna-green.svg"
                console.log("armed")
                return _connect.icon.source = "/qmlimages/antenna-green.svg"
//////////                if (_activeVehicle.flying) {
//////////                    return mainStatusLabel._flyingText
//////////                } else if (_activeVehicle.landing) {
//////////                    return mainStatusLabel._landingText
//////////                } else {
//////////                    return mainStatusLabel._armedText
                }
            } /*////////// else {
                if (_activeVehicle.readyToFlyAvailable) {
                    if (_activeVehicle.readyToFly) {
//////////                        statusSource = "/qmlimages/antenna-green.svg"
                        console.log("readyToFly")
                        return _connect.icon.source = "/qmlimages/antenna-green.svg"
                    } else {
//////////                        statusSource = "/qmlimages/antenna-yellow.svg"
                        console.log("no readyToFly")
                        return _connect.icon.source = "/qmlimages/antenna-yellow.svg"
                    }
                } else {
                    // Best we can do is determine readiness based on AutoPilot component setup and health indicators from SYS_STATUS
                    if (_activeVehicle.allSensorsHealthy && _activeVehicle.autopilot.setupComplete) {
                        console.log("allSensorsHealthy && setupComplete")
//////////                        statusSource = "/qmlimages/antenna-green.svg"
                        return _connect.icon.source = "/qmlimages/antenna-green.svg"
                    } else {
//////////                        statusSource = "/qmlimages/antenna-yellow.svg"
                        console.log("no allSensorsHealthy && no setupComplete")
                        return _connect.icon.source = "/qmlimages/antenna-yellow.svg"
                    }
                }
            }
//////////        } else {
//////////            statusSource = qgcPal.brandingPurple
//////////        console.log("disconnectedText")
//////////            return _connect.icon.source =
        } //////////*/
    }

    Button {
        id: _connect
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.leftMargin: 5
        icon.color: "transparent"
        icon.source: "/qmlimages/antenna-green.svg"
//////////        icon.source:  fStatusSource()

        ToolTip.visible: hovered
        ToolTip.text: qsTr("Соединение")
//////////        ToolTip.text: statusText()

        background: Rectangle {

            property string normalColor: qgcPal.window
            property string hoveredColor: "#3f3f3f"
            property string pressedColor: "#000000"

            implicitWidth: 40
            implicitHeight: 40
            color: _connect.pressed ? pressedColor :
                      _connect.hovered ? hoveredColor :
                                           normalColor
            radius: 20
            border.width: 1.0
            border.color: "#ffffff"
        }
    }
}
