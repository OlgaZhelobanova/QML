#ifndef STARLIST_H
#define STARLIST_H


#include <QAbstractListModel>
#include <QVariant>
#include <QList>
#include <QModelIndex>
#include <QItemSelectionModel>
#include "star.h"

class StarList : public QAbstractListModel
{
    Q_OBJECT

    Q_PROPERTY(QAbstractListModel* starModel READ getModel CONSTANT)  /* первый параметр - тип свойства (property)
                                                                     второй параметр - имя свойства, по которому будем обращаться к реальной модели в qml-файле
                                                                     третий параметр - метод С++ для получения значения свойства (получим саму модель)
                                                                     CONSTANT - qml получит свойство однократно, и в процессе работы это свойство изменяться не будет */
private:
    QList<Star> listOfStars; // непосредственно данные
    QAbstractListModel *getModel();

public:
    StarList(QObject *parent = nullptr);
    ~StarList() override;

    // количество колонок
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;

     // возвращение данных модели по указанному индексу и роли
    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const override;

    enum ResentRoles {
            name = Qt::DisplayRole,
            pleiad = Qt::UserRole + 1,
            size = Qt::UserRole + 2,
            distance = Qt::UserRole + 3,
            coord = Qt::UserRole + 4
       };

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void add(const QString& nameSt, const QString& pleiadSt, const int sizeSt, const int distanceSt, const int coordSt);  // макрос указывает, что к методу можно обратиться из QML
    Q_INVOKABLE void del(const int index);
    Q_INVOKABLE void edit(const QString& nameSt, const QString& pleiadSt, const int sizeSt, const int distanceSt, const int coordSt, const int index);
    Q_INVOKABLE int countStars(int number);

};

#endif // STARLIST_H
