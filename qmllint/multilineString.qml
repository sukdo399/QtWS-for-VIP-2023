// ~/Qt/6.6.0/macos/bin/qmllint --fix multilineString.qml
// Applied fixes to "multilineString.qml". Backup created at "multilineString.qml.bak"

import QtQml

QtObject {
    property string multipart: "Foo
multiline`
string" + "another`
part
of it";

    property string quote: "
quote: \" \\\" \\\\\"
ticks: ` \` \\\` \\\`
singleTicks: ' \' \\' \\\'
expression: \${expr} \${expr} \\\${expr} \\\${expr}"

    property string tick: '
quote: " \" \\" \\\"
ticks: \` \` \\\` \\\`
singleTicks: \' \\\' \\\\\'
expression: \${expr} \${expr} \\\${expr} \\\${expr}'
}
