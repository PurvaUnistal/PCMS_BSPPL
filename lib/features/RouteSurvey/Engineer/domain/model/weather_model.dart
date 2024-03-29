class WeatherModel {
  dynamic id;
  String? name;
  WeatherModel({this.name, this.id});


  static getWeatherData() {
     List<WeatherModel> weatherList = [];
     weatherList.add(WeatherModel(
       id: "1",
       name: "Sunny"
       )
     );
     weatherList.add(WeatherModel(
         id: "2",
         name: "Cloudy"
     )
     );
     weatherList.add(WeatherModel(
         id: "3",
         name: "Rainy"
     )
     );
     return weatherList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}