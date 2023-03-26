import 'package:flutter/cupertino.dart';

import 'package:persistence/models/place.dart';

class GreatPlaces with ChangeNotifier{
  List<Place> _placesList = [];

  List<Place> get getPlaces {
    return [..._placesList];
  }

  int get placesCount{
    return _placesList.length;
  }

  Place getPlaceByIndex(int index){
    return _placesList[index];
  }
}