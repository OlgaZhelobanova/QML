#ifndef STAR_H
#define STAR_H

#include <QString>
class Star
{
private:

    QString starName;
    QString starPleiad;
    int starSize;
    int starDistance;
    int starCoord;

public:
    Star();
    QString getStarName() const;
    QString getStarPleiad() const;
    int getStarSize() const;
    int getStarDistance() const;
    int getStarCoord() const;
    void setStarName(const QString &SN);
    void setStarPleiad(const QString &SP);
    void setStarSize(const int SS);
    void setStarDistance(const int SD);
    void setStarCoord(const int SC);
};

#endif // STAR_H
