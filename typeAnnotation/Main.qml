import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    CheckBox {
        id: checkBox
    }

    function updateCheckkBox(locked) {
    // Fix
//    function updateCheckkBox(locked: bool): void {
        checkBox.checked = !locked
    }

    Component.onCompleted: {
        for (let i = 0; i < 5; i++)
            updateCheckkBox(checkBox.checked)
    }
}
