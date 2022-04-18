#include "starlist.h"
#include <QDebug>

StarList::StarList(QObject* parent):QAbstractListModel(parent)
{
  add("Бетельгейзе", "Орион",1000,100,0);
  add("Арктур", "Боутес",8004,80,0);
  add("Вега", "Лира",1700,35,0);

}

StarList::~StarList()
{

}

int StarList::rowCount(const QModelIndex&) const
{
    return listOfStars.size();
}


QVariant StarList::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= listOfStars.size())
            return QVariant();
      {
        switch (role) {
                case name:
                    return QVariant(listOfStars.at(index.row()).getStarName());
                case pleiad:
                    return QVariant(listOfStars.at(index.row()).getStarPleiad());

                case size:
                    return QVariant(listOfStars.at(index.row()).getStarSize());
                case distance:
                    return QVariant(listOfStars.at(index.row()).getStarDistance());
                case coord:
                    return QVariant(listOfStars.at(index.row()).getStarCoord());

                default:
                    return QVariant();
            }

    }
}

QHash<int, QByteArray> StarList::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[name] = "nameOfStar";
    roles[pleiad] = "pleiadOfStar";
    roles[size] = "sizeOfStar";
    roles[distance] = "distanceOfStar";
    roles[coord] = "coordOfStar";
       return roles;
}

void StarList::add(const QString& nameSt, const QString& pleiadSt, const int sizeSt, const int distanceSt, const int coordSt){
     Star star;
    star.setStarName(nameSt);
    star.setStarPleiad(pleiadSt);
    star.setStarSize(sizeSt);
    star.setStarDistance(distanceSt);
    star.setStarCoord(coordSt);

    beginInsertRows(QModelIndex(),listOfStars.size(),listOfStars.size());
    listOfStars.append(star);  //добавление в конец списка
    endInsertRows();

}

QAbstractListModel* StarList::getModel(){
    return this;
}

void StarList::del(const int index){

     if (index >= 0 && index < listOfStars.size())
     {

    // сообщение модели о процессе удаления данных
         beginRemoveRows(QModelIndex(), index, index);
        listOfStars.removeAt(index);
              endRemoveRows();
     }
     else qDebug() << "Error index";

}

void StarList::edit(const QString& nameSt, const QString& pleiadSt, const int sizeSt, const int distanceSt, const int coordSt, const int index) {
     if(index >= 0 && index < listOfStars.size() )
     {
        auto& currentStar = listOfStars[index];
        if (currentStar.getStarName().compare(nameSt)!=0 || currentStar.getStarPleiad() != pleiadSt || currentStar.getStarSize() != sizeSt || currentStar.getStarDistance() != distanceSt|| currentStar.getStarCoord() != coordSt)
        {
            currentStar.setStarName(nameSt);
            currentStar.setStarPleiad(pleiadSt);
            currentStar.setStarSize(sizeSt);
            currentStar.setStarDistance(distanceSt);
            currentStar.setStarCoord(coordSt);


            auto modelIndex = createIndex(index, 0);
            emit dataChanged(modelIndex, modelIndex);
            qDebug() << listOfStars[index].getStarCoord();
        }

     }
      else qDebug() << "Error index";
}

int StarList::countStars(int number)
{
    int k = 0;
    for (int i = 0; i < listOfStars.size(); i++)
    {
        int size;
        size = listOfStars[i].getStarSize();
        if (size > number)
        k++;
    }
    return k;
}
