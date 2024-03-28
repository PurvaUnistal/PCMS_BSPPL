class ProvideModel {
  dynamic id;
  String? name;
  ProvideModel({this.name, this.id});


  static getProvideData() {
    List<ProvideModel> provideList = [];
    provideList.add(ProvideModel(
        id: "1",
        name: "Provide"
    )
    );
    provideList.add(ProvideModel(
        id: "2",
        name: "Not Applicable"
    )
    );

    return provideList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}