#include "star.h"

Star::Star()
{

}
QString Star::getStarName() const
{
    return starName;
}
QString Star::getStarPleiad() const
{
    return starPleiad;
}
int Star::getStarSize() const
{
    return starSize;
}
int Star::getStarDistance() const
{
    return starDistance;
}
int Star::getStarCoord() const
{
    return starCoord;
}
void Star::setStarName(const QString &SN)
{
    starName = SN;
}
void Star::setStarPleiad(const QString &SP)
{
    starPleiad = SP;
}
void Star::setStarSize(const int SS)
{
    starSize = SS;
}
void Star::setStarDistance(const int SD)
{
    starDistance = SD;
}
void Star::setStarCoord(const int SC)
{
    starCoord = SC;
}
