import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Window

// bi-directional binding
Window {
    id: rootWindow
    width: 640
    height: 480
    visible: true

    property real backendValue: 0.0
    Timer {
        running: true
        repeat: true
        interval: 1000
        onTriggered: rootWindow.backendValue = Math.random()
    }

    Timer {
        running: true
        repeat: false
        interval: 3000
        onTriggered: myControl.updateTheValue()
    }
    Slider {
        value: myControl.value
        onValueChanged: rootWindow.backendValue = value
    }


    // 1. binding will be broken in 3 seconds
    // JavaScript defined property will overwrite the binding
    component SomeControl : Item {
        property real value: 0
        function updateTheValue() {
            console.log("updateValue")
            value = 1.0
        }
    }

    SomeControl {
        id: myControl
        value: rootWindow.backendValue
    }

    // 2. binding will be maintained
    // In this case, binding is maintained because value is never written to.  The backend value must accept the change.
    // Can also operate as standalone when using this pattern.
//    component SomeControl : Item {
//        // Mirror the internal value until re-bound
//        property real value: internal.value
//        onValueChanged: {
//            if (internal.value != value)
//                internal.value = value;
//        }

//        signal valueModified(newValue : real)

//        function updateTheValue() {
//            console.log("updateValue")
//            internal.value = 1.0
//            valueModified(internal.value)
//        }

//        QtObject {
//            id: internal
//            property real value: 0.0
//        }
//    }

//    SomeControl {
//        id: myControl
//        value: rootWindow.backendValue
//        onValueModified: (newValue) => rootWindow.backendValue = newValue
//    }
}
