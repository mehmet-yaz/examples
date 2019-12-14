//Hello

setPrefMapStrInt(String key, Map<String, int> map) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  List<String> objects = new List<String>();
  map.forEach((k, v) {
    String str = k + "." + v.toString(); //TODO: Change pattern in accordance with the project.
    objects.add(str);
  });
  sharedPreferences.setStringList(key, objects);
}

Future<Map<String, int>> getPrefMapStrInt(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map<String, int> map = new Map<String, int>();
  List<String> listMap = sharedPreferences.getStringList(key) ?? [];
  listMap.forEach((element) {
    List<String> entry = element.split('.');  //TODO: Change pattern in accordance with the project.
    int value = int.parse(entry[1]);
    map[entry[0]] = value;
  });
  return map;
}

Future<Map<String, Map<String, String>>> getPrefMapStrMap(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Map<String, Map<String, String>> map = new Map<String, Map<String, String>>();
  List<String> listMap =
      sharedPreferences.getStringList(key) ?? new List<String>();
  listMap.forEach((element) {
    List<String> entry = element.split('.');  //TODO: Change pattern in accordance with the project.
    String value = entry[0];
    List<String> objects = entry[1].split(',');  //TODO: Change pattern in accordance with the project.
    Map<String, String> valueMap = new Map<String, String>();
    objects.forEach((object) {
      List<String> objStr = object.split(':');  //TODO: Change pattern in accordance with the project.
      valueMap[objStr[0]] = objStr[1];
    });
    map[value] = valueMap;
  });
  return map;
}

setPrefMapFromMapStrMap(
    String key, Map<String, Map<String, dynamic>> map) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  List<String> objects = new List<String>();
  map.forEach((k, v) {
    int i = 0;
    int len = v.length;
    String mapStr = "";
    v.forEach((k1, v1) {
      if (i == len - 1) {
        mapStr += k1.toString() + ":" + v1.toString();  //TODO: Change pattern in accordance with the project.
      } else {
        mapStr += k1.toString() + ":" + v1.toString() + ",";  //TODO: Change pattern in accordance with the project.
      }
      i++;
    });
    String str = k.toString() + "." + mapStr;  //TODO: Change pattern in accordance with the project.
    objects.add(str);
  });
  sharedPreferences.setStringList(key, objects);
}
