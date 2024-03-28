class CompletedModel {
  dynamic id;
  String? name;
  CompletedModel({this.name, this.id});


  static getCompletedData() {
    List<CompletedModel> completedList = [];
    completedList.add(CompletedModel(
        id: "1",
        name: "Completed"
    )
    );
    completedList.add(CompletedModel(
        id: "2",
        name: "Not Applicable"
    )
    );

    return completedList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}