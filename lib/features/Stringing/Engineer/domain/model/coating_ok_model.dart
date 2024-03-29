class CoatingOkModel{
  dynamic id;
  String? name;
  CoatingOkModel({this.name, this.id});


  static getCoatingOkData() {
    List<CoatingOkModel> coatingOkList = [];
    coatingOkList.add(CoatingOkModel(
        id: "1",
        name: "No"
    ));
    coatingOkList.add(CoatingOkModel(
        id: "2",
        name: "Yes"
    ));
    return coatingOkList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}