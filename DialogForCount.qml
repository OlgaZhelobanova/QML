import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 2.2 // это версия библиотеки, содержащей Contol (аналоги виджетов) для версии Qt 5.6
import QtQuick.Layouts 1.2

Window {
    id: root
    modality: Qt.ApplicationModal  // окно объявляется модальным
    title: qsTr(" ")
    minimumWidth: 500
    maximumWidth: 500
    minimumHeight: 100
    maximumHeight: 100

    GridLayout {//таблица для ввода данных о новой звезде
        anchors { left: parent.left; top: parent.top; right: parent.right; bottom: buttonCancel.top; margins: 10 }
        columns: 2


    Label{
        id: labelText
        Layout.alignment: Qt.AlignLeft

        font.pixelSize: 19
        text: "Количество звезд, величина которых
превышает введенное пользователем значение: "
    }
    Label{
        id: labelNumber
        anchors.left: labelText.right
        anchors.leftMargin: 25
        font.pixelSize: 19
        text: "label"
    }
  }

    function execute2(count){
        labelNumber.text = count
        root.show()
    }
}
