class TerrainModel {
  dynamic id;
  String? name;
  TerrainModel({this.name, this.id});


  static getTerrainData() {
    List<TerrainModel> terrainList = [];
    terrainList.add(TerrainModel(
        id: "1",
        name: "Normal"
    )
    );
    terrainList.add(TerrainModel(
        id: "2",
        name: "Rock"
    )
    );
    terrainList.add(TerrainModel(
        id: "3",
        name: "Seismic"
    )
    );

    return terrainList;
  }

  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}