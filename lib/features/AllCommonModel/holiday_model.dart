class HolidayModel {
  dynamic id;
  String? name;
  HolidayModel({this.name, this.id});


  static getHolidayData() {
    List<HolidayModel> holidayList = [];
    holidayList.add(HolidayModel(
        id: "1",
        name: "At time of Lowering"
    )
    );
    holidayList.add(HolidayModel(
        id: "2",
        name: "Ok"
    )
    );
    holidayList.add(HolidayModel(
        id: "3",
        name: "Not Ok"
    )
    );

    return holidayList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}