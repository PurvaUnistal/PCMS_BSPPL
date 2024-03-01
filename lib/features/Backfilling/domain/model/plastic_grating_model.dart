class PlasticGratingModel {
  dynamic id;
  String? name;
  PlasticGratingModel({this.name, this.id});


  static getPlasticGratingData() {
    List<PlasticGratingModel> plasticGratingList = [];
    plasticGratingList.add(PlasticGratingModel(
        id: "1",
        name: "Applicable"
    )
    );
    plasticGratingList.add(PlasticGratingModel(
        id: "2",
        name: "Not Applicable"
    )
    );

    return plasticGratingList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}