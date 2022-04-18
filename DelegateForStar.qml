import QtQuick 2.2
import QtQuick.Controls 2.2  // это версия библиотеки, содержащей Control (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 1.2
import "JavaScript.js" as MyJS

Rectangle {
    id: starItem
    readonly property color evenBackgroundColor: "#f9f9f9"  // цвет для четных пунктов списка
    readonly property color oddBackgroundColor: "#ffffff"   // цвет для нечетных пунктов списка
    readonly property color selectedBackgroundColor: "#eaf1f7"  // цвет выделенного элемента списка

    property bool isCurrent: starItem.ListView.view.currentIndex === index   // назначено свойство isCurrent истинно для текущего (выделенного) элемента списка
    property bool selected: starItemMouseArea.containsMouse || isCurrent // назначено свойство "быть выделенным",
    //которому присвоено значение "при наведении мыши,
    //или совпадении текущего индекса модели"

    property variant starData: model // свойство для доступа к данным конкретной звезды

    width: parent ? parent.width : starList.width//лог. операция (если есть родитель, установить ширину, равной ширине родителя, иначе установить ширину studList)
    height: 200

    // состояние текущего элемента (Rectangle)
    states: [
        State {
            when: selected
            // как реагировать, если состояние стало selected
            PropertyChanges { target: starItem;  // для какого элемента должно назначаться свойство при этом состоянии (selected)
                color: MyJS.selected()  /* какое свойство целевого объекта (Rectangle)
                                                                                                  и какое значение присвоить*/
            }
        },
        State {
            when: !selected
            PropertyChanges { target: starItem;  color: MyJS.notselected() }
        }
    ]

    MouseArea {
        id: starItemMouseArea
        anchors.fill: parent//растянута по всему Rectangle
        hoverEnabled: true//Наведение курсора мыши позволяет обрабатывать все события мыши, даже если кнопка мыши не нажата.
       // Это свойство влияет на свойство containsMouse и сигналы onEntered, onExited и onPositionChanged
        onClicked: {
            starItem.ListView.view.currentIndex = index
            starItem.forceActiveFocus()
        }
    }
    Item {
        id: itemOfStars
        width: parent.width
        height: 200

        Column{
            id: t2
            anchors.left: parent.left
            anchors.leftMargin: 10
            width: 240
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: t1
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Имя звезды:"
                color: "firebrick"
                font.pointSize: 12
            }
            Text {
                id: textName
                anchors.horizontalCenter: parent.horizontalCenter
                text: nameOfStar
                color: "purple"
                font.pointSize: 18
                font.bold: true
            }
        }
        Column{
            anchors.left: t2.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            Text {

                text: "Созвездие"
                color: "firebrick"
                font.pointSize: 10
            }
            Text {
                id: textPleiad
                text: pleiadOfStar
                color: "purple"
                font.pointSize: 12
            }
            Text {

                text: "Размеры звезды"
                color: "firebrick"
                font.pointSize: 10
            }
            Text {
                id: textSize
                color: "purple"
                text: sizeOfStar
                font.pointSize: 12
            }
            Text {

                text: "Расстояние до Земли"
                color: "firebrick"
                font.pointSize: 10
            }
            Text {
                id: textDistance
                color: "purple"
                text: distanceOfStar
                font.pointSize: 12
            }
            Text {

                text: "Координаты звезды"
                color: "firebrick"
                font.pointSize: 10
            }
            Text {
                id: textCoord
                color: "purple"
                text: coordOfStar
                font.pointSize: 12
            }
        }

    }
}
