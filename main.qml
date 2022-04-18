import QtQuick 2.2
import QtQuick.Window 2.2//библиотека для окна
import QtQuick.Controls 2.2// это версия библиотеки, содержащей Control (аналоги виджетов) для версии Qt 5.6 //для кнопок
import QtQuick.Layouts 1.2



Window {//создает виджет основного окна
    visible: true
    width: 700
    height: 480
    title: qsTr("СПРАВОЧНИК АСТРОНОМА")//qsTr - для локализации языка

    // объявляется системная палитра//используется в DelegateForStars
    SystemPalette {//используется для раскрашивания элементов таким образом, чтобы обеспечить более естественный внешний вид
          id: palette;
          colorGroup: SystemPalette.Active
       }

    Rectangle{//parent - Window
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: btnAdd.top
        anchors.bottomMargin: 8//границы прямоугольника снизу
        border.color: "gray"
    ScrollView {
        anchors.fill: parent//займет всё пространство родителя, то есть Rectangle
        //flickableItem.interactive: true  // сохранять свойство "быть выделенным" при потере фокуса мыши

        ListView {
            id: starList
            anchors.fill: parent
            model: starModel // назначение модели, данные которой отображаются списком
            delegate: DelegateForStar{}
            clip: true //запрет отображения графического изображения вне установленных границ
            activeFocusOnTab: true  // реагирование на перемещение между элементами ввода с помощью Tab
            focus: true  // элемент может получить фокус
        }
    }
   }

    Button {
        id: btnAdd
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        anchors.right:btnEdit.left
        text: "Добавить"
        width: 100

        onClicked: windowAdd.show()
    }

    Button {
        id: btnEdit
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right: btnDel.left
        anchors.rightMargin: 8
        text: "Редактировать"
        enabled: starList.currentIndex >= 0
        width: 100

        onClicked: {
            var nameSt = starList.currentItem.starData.nameOfStar//передаются текущие данные в окно
            var pleiadSt = starList.currentItem.starData.pleiadOfStar
            var sizeSt = starList.currentItem.starData.sizeOfStar
            var distanceSt = starList.currentItem.starData.distanceOfStar
            var coordSt = starList.currentItem.starData.coordOfStar

            windowEdit.execute(nameSt, pleiadSt, sizeSt, distanceSt, coordSt, starList.currentIndex)//метод execute элемента Window в DialogForEdit//передает текущие данные в окно
        }
    }

    Button {
        id: btnDel
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.right:parent.right
        anchors.rightMargin: 8
        text: "Удалить"
        width: 100
        enabled: starList.currentIndex >= 0//кнопка доступна только когда мы выделяем какой-либо элемент в starList
        onClicked: del(starList.currentIndex)
    }

    Button {
        id: btnCount
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 8
        anchors.rightMargin: 8
        anchors.right:btnAdd.left
        text: "Рассчитать"
        width: 100


        onClicked: {

            var count = countStars(textField1.text);
            windowCount.execute2(count)
        }
    }

    DialogForCount{
        id: windowCount
    }
    DialogForAdd {
        id: windowAdd
    }
    DialogForEdit{
        id: windowEdit
    }

    Label{
        id: label1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left:parent.left
        anchors.leftMargin: 8
        text: "Введите число: "
        visible: starList.currentIndex >= 0
    }

    TextField{
        id: textField1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.left:label1.right
        anchors.leftMargin: 8
        width: 70
        visible: starList.currentIndex >= 0
        validator: IntValidator {bottom: 10; top: 10000}
    }
}
