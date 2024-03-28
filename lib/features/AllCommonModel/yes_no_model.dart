class YesNoModel {
  dynamic id;
  String? name;
  YesNoModel({this.name, this.id});


  static getYesNoData() {
    List<YesNoModel> yesNoList = [];
    yesNoList.add(YesNoModel(
        id: "1",
        name: "Yes"
    )
    );
    yesNoList.add(YesNoModel(
        id: "2",
        name: "No"
    )
    );

    return yesNoList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}