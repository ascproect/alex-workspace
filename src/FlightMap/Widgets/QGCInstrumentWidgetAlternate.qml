/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick 2.3

import QGroundControl               1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0
import QGroundControl.FactSystem    1.0
import QGroundControl.FlightMap     1.0
import QGroundControl.Palette       1.0

Rectangle {
    height: _outerRadius * 5
//////////    radius: _outerRadius

    color:  QGroundControl.globalPalette.window
//////////
//    opacity: 0.1
//////////

    property real _outerMargin: (width * 0.05) / 2
    property real _outerRadius: width / 2
    property real _innerRadius: _outerRadius - _outerMargin

    // Предотвратить переход всех кликов на нижние слои
    DeadMouseArea {
        anchors.fill: parent
    }

    QGCCompassWidget { // компас
        id:                         compass
        anchors.horizontalCenter:   parent.horizontalCenter
//////////        anchors.topMargin:          _outerMargin * 2
        anchors.topMargin:          _outerMargin
//////////        anchors.top:                attitude.bottom
        anchors.top:                parent.top
        size:                       _innerRadius * 2
        vehicle:                    globals.activeVehicle
    }

    QGCAttitudeWidget { // авиагоризонт
        id:                         attitude
        anchors.horizontalCenter:   parent.horizontalCenter
//////////        anchors.topMargin:          _outerMargin
        anchors.topMargin:          _outerMargin * 2
//////////        anchors.top:                parent.top
        anchors.bottom:             parent.bottom
        size:                       _innerRadius * 2
        vehicle:                    globals.activeVehicle
    }

/*//////////    QGCCompassWidget { // компас
        id:                         compass
        anchors.horizontalCenter:   parent.horizontalCenter
        anchors.topMargin:          _outerMargin * 2
        anchors.top:                attitude.bottom
        size:                       _innerRadius * 2
        vehicle:                    globals.activeVehicle
    } //////////*/
}
