import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2 // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 1.2
import "JavaScript.js" as MyJS


Window {
    id: root
    modality: Qt.ApplicationModal  // окно объявляется модальным
    title: qsTr("Редактирование информации о звезде")
    minimumWidth: 500
    maximumWidth: 500
    minimumHeight: 400
    maximumHeight: 400

    property int currentIndex: -1

    GridLayout {
        anchors { left: parent.left; top: parent.top; right: parent.right; bottom: buttonCancel.top; margins: 10 }
        columns: 2

        Label {
            Layout.alignment: Qt.AlignRight  // выравнивание по правой стороне
            text: qsTr("Название звезды:")
        }
        TextField {
            id: textName
            Layout.fillWidth: true
            placeholderText: qsTr("Введите название звезды")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Созвездие:")
        }
        TextField {
            id: textPleiad
            Layout.fillWidth: true
            placeholderText: qsTr("Введите созвездие")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Размер звезды:")
        }
        TextField {
            id: textSize
            Layout.fillWidth: true
            placeholderText: qsTr("Введите размер звезды")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Расстояние от Земли:")
        }
        TextField {
            id: textDistance
            Layout.fillWidth: true
            placeholderText: qsTr("Введите расстояние от Земли")
        }
        Label {
            Layout.alignment: Qt.AlignRight
            text: qsTr("Координаты:")
        }
        TextField {
            id: textCoord
            Layout.fillWidth: true
            placeholderText: qsTr("Введите координаты")
        }
    }
//    Button {
//        visible: {textName.length>0 && textPleiad.length>0 && root.currentIndex <0}
//        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
//        text: qsTr("Добавить")
//        width: 100
//        onClicked: {
//            root.hide()
//            add(textName.text, textPleiad.text, textSize.text, textDistance.text, textCoord.text)
//        }
//    }
    Button {
        visible: {root.currentIndex>=0}
        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
        text: qsTr("Применить")
        width: 100
        onClicked: {
            root.hide()
            edit(textName.text, textPleiad.text, textSize.text, textDistance.text, textCoord.text, root.currentIndex)
        }
    }
    Button {
        id: buttonCancel
        anchors { right: parent.right; bottom: parent.bottom; rightMargin: 10; bottomMargin: 10 }
        text: qsTr("Отменить")
        width: 100
        onClicked: {
             root.hide()
        }
    }

    function execute(name, pleiad, size, distance, coord, index){
        textName.text = name
        textPleiad.text = pleiad
        textSize.text = size
        textDistance.text = distance
        textCoord.text = coord
        root.currentIndex = index

        root.show()
    }

 }
