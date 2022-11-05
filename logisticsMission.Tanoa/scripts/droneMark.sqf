//This script will control the tracking of markers

while {not isNull droneMed || not isNull droneCar} do
{
    "marker_5" setMarkerPos getPos droneCar;
    "marker_6" setMarkerPos getPos droneMed;

    sleep 0.5;
};
