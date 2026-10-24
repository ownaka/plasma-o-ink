import QtQuick

Rectangle {
    id: root
    color: "#0c0c0c"
    property int stage

    onStageChanged: {
        if (stage >= 2) bar.width = Qt.binding(() => track.width * Math.min(stage / 6, 1))
    }

    Canvas {
        anchors.fill: parent
        opacity: 0.08
        onPaint: {
            var ctx = getContext("2d");
            ctx.fillStyle = "#e6e1d5";
            for (var y = 12; y < height; y += 24)
                for (var x = 12; x < width; x += 24)
                    ctx.fillRect(x, y, 2, 2);
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 28

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 9
            Row { spacing: 16; Rectangle { width: 34; height: 9; color: "#689d6a" } Rectangle { width: 34; height: 9; color: "#689d6a" } }
            Rectangle { width: 84; height: 9; color: "#689d6a" }
            Row { spacing: 16; Rectangle { width: 34; height: 9; color: "#689d6a" } Rectangle { width: 34; height: 9; color: "#689d6a" } }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "ownaka"
            color: "#e6e1d5"
            font.family: "Commit Mono"
            font.pixelSize: 18
            font.letterSpacing: 2
        }

        Rectangle {
            id: track
            anchors.horizontalCenter: parent.horizontalCenter
            width: 180; height: 2
            color: "#222222"
            Rectangle { id: bar; height: parent.height; width: 0; color: "#689d6a"
                Behavior on width { NumberAnimation { duration: 250 } } }
        }
    }
}
