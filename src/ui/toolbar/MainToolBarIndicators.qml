/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick 2.12

import QGroundControl               1.0
import QGroundControl.ScreenTools   1.0

//-------------------------------------------------------------------------
//-- Индикаторы панели инструментов
Row {
    id:                 indicatorRow
    anchors.top:        parent.top
    anchors.bottom:     parent.bottom
    anchors.margins:    _toolIndicatorMargins
    spacing:            ScreenTools.defaultFontPixelWidth * 1.5

    property var  _activeVehicle:           QGroundControl.multiVehicleManager.activeVehicle
    property real _toolIndicatorMargins:    ScreenTools.defaultFontPixelHeight * 0.66

    Repeater {
        id:     appRepeater
        model:  QGroundControl.corePlugin.toolBarIndicators
        Loader {
            anchors.top:        parent.top
            anchors.bottom:     parent.bottom
            source:             modelData
            visible:            item.showIndicator
            //////////
            //////////onLoaded: console.log("Loader1: " + model.modelData)
            //////////
        }
    }

    // загружаются: Рупор, Состояние GPS, Состояние(показатель качества радиосигнала) RC(передатчик и приемник радиоуправления) RSSI(Индикация уровня принимаемого сигнала)
    Repeater {
        model: _activeVehicle ? _activeVehicle.toolIndicators : []
        Loader {
            anchors.top:        parent.top
            anchors.bottom:     parent.bottom
            source:             modelData
            visible:            item.showIndicator
            //////////
            //////////onLoaded: console.log("Loader2: " + model.modelData)
            ////////// onStatusChanged: console.log("onStatusChanged Loader2")
            //////////
        }
    }

    Repeater {
        model: _activeVehicle ? _activeVehicle.modeIndicators : []
        Loader {
            anchors.top:        parent.top
            anchors.bottom:     parent.bottom
            source:             modelData
            visible:            item.showIndicator
            //////////
            //////////onLoaded: console.log("Loader3: " + model.modelData)
            //////////
        }
    }
}
