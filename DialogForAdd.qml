import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2 // это версия библиотеки, содержащей Control (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 1.2


Window {
    id: root
    modality: Qt.ApplicationModal  // окно объявляется модальным //модальное окно не позволяет другим окнам получать входные события
    title: qsTr("Добавление информации о звезде")
    minimumWidth: 500
    maximumWidth: 500
    minimumHeight: 400
    maximumHeight: 400

    GridLayout {//таблица для ввода данных о новой звезде
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

    Button {
        visible: {textName.length>0 && textPleiad.length>0}
        anchors { right: buttonCancel.left; verticalCenter: buttonCancel.verticalCenter; rightMargin: 10 }
        text: qsTr("Добавить")
        width: 100
        onClicked: {
            root.hide()
            add(textName.text, textPleiad.text, textSize.text, textDistance.text, textCoord.text)
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

    // изменение статуса видимости окна диалога//делаем поля для ввода пустыми, когда окно открывается
    onVisibleChanged: {
      if (visible) {
          textName.text = ""
          textPleiad.text = ""
          textSize.text = ""
          textDistance.text = ""
          textCoord.text = ""

      }
    }
 }
