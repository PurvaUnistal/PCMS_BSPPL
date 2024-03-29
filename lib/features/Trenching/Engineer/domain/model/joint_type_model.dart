class JointTypeModel {
  dynamic id;
  String? name;
  JointTypeModel({this.name, this.id});


  static getJointTypeData() {
    List<JointTypeModel> jointTypeList = [];
    jointTypeList.add(JointTypeModel(
        id: "1",
        name: "Select Type"
    ));
    jointTypeList.add(JointTypeModel(
        id: "2",
        name: "M"
    ));
    jointTypeList.add(JointTypeModel(
        id: "3",
        name: "T"
    ));
    jointTypeList.add(JointTypeModel(
        id: "4",
        name: "FT"
    ));
    jointTypeList.add(JointTypeModel(
        id: "5",
        name: "GT"
    ));
    jointTypeList.add(JointTypeModel(
        id: "6",
        name: "FTR"
    ));
    jointTypeList.add(JointTypeModel(
        id: "7",
        name: "TR"
    ));
    jointTypeList.add(JointTypeModel(
        id: "8",
        name: "MTR"
    ));
   return jointTypeList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}