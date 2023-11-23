// from https://spyro-soft.com/developers/how-to-become-friends-with-qmllint


import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    readonly property int delegateWidth: 640
    readonly property int delegateHeight: 30

    ListModel {
        id: items

        ListElement {
            name: "red"
            textColor: "red"
        }
        ListElement {
            name: "blue"
            textColor: "blue"
        }
        ListElement {
            name: "green"
            textColor: "green"
        }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: items

        delegate: Label {
            text: model.name
            color: model.textColor

            width: delegateWidth
            height: delegateHeight

            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }
}

/*
How to run qmllint
~/Qt/6.6.0/gcc_64/bin/qmllint Main.qml

*/

// Fix:
/*
//Added necessary pragma at the top of the file
pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    readonly property int delegateWidth: 640
    readonly property int delegateHeight: 30

    ListModel {
        id: items

        ListElement {
            name: "red"
            textColor: "red"
        }
        ListElement {
            name: "blue"
            textColor: "blue"
        }
        ListElement {
            name: "green"
            textColor: "green"
          }
    }

    ListView {
        id: listView
        anchors.fill: parent
        model: items

        delegate: Label {
            required property string name
            required property string textColor

            text: name
            color: textColor

            width: root.delegateWidth
            height: root.delegateHeight

            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }
}
*/
