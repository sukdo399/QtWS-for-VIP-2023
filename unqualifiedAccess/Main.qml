import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property string testString: "rootWindow"

    Rectangle {
        id: parentRectangle
        width: 200
        height: 200
        color: "green"
        property string testString: "parentRectangle"

        Rectangle {
            id: innerRectangle
            width: 100
            height: 100
            color: "red"
            anchors.centerIn: parentRectangle
            property string testString: "innerRectangle"

            // Unqualified Access: access to testString property of rootWindow
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("testString:", testString)

                    // FIX:
//                    console.log("testString:", parentRectangle.testString)
                }
            }
        }
    }
}
