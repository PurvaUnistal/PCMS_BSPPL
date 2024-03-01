class CheckModel {
  dynamic id;
  String? name;
  CheckModel({this.name, this.id});


  static getCheckData() {
    List<CheckModel> checkList = [];
    checkList.add(CheckModel(
        id: "1",
        name: "Ok"
    )
    );
    checkList.add(CheckModel(
        id: "2",
        name: "Not Ok"
    )
    );

    return checkList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}