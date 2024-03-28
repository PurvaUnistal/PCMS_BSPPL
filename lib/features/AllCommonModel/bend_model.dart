class BendModel {
  dynamic id;
  String? name;
  BendModel({this.name, this.id});


  static getBendData() {
    List<BendModel> bendList = [];
    bendList.add(BendModel(
        id: "1",
        name: "Sag"
    ));
    bendList.add(BendModel(
        id: "2",
        name: "Over"
    ));
    bendList.add(BendModel(
        id: "3",
        name: "HR"
    ));
    bendList.add(BendModel(
        id: "4",
        name: "HL"
    ));

    return bendList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}