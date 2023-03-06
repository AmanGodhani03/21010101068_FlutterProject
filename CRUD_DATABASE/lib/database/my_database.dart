import 'dart:io';
import 'package:crud_database/City_model.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'api_db.db');
    return await openDatabase(databasePath);
  }

  Future<bool> copyPasteAssetFileToRoot() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "api_db.db");

    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound) {
      ByteData data =
          await rootBundle.load(join('assets/database', 'api_db.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      return true;
    }
    return false;
  }

  Future<List<Map<String, Object?>>> getDatafromUserList() async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data = await db.rawQuery(
        "select User_List.UserName,City_List.City,DOB,UserId from User_List inner join City_List on User_List.CityId=City_List.CityId");
    return data;
  }

  Future<List<Citymodel>> getCityList() async {
    Database db = await initDatabase();
    List<Map<String, Object?>> data =
        await db.rawQuery("select * from City_List");
    List<Citymodel> citylist = [];
    for (int i = 0; i < data.length; i++) {
      Citymodel model = Citymodel();
      model.CityId = int.parse(data[i]['CityId'].toString());
      model.City = data[i]['City'].toString();
      citylist.add(model);
    }
    return citylist;
  }

  Future<int> insertuserdb(map) async {
    Database db = await initDatabase();
    int UserId = await db.insert("User_List", map);
    return UserId;
  }

  Future<int> updateuserdb(map, id) async {
    Database db = await initDatabase();
    int Userid =
        await db.update("User_List", map, where: "UserId=?", whereArgs: [id]);
    return Userid;
  }

  Future<int> deletedb(id) async {
    Database db = await initDatabase();
    int Userid =
        await db.delete("User_List", where: "UserId=?", whereArgs: [id]);
    return Userid;
  }
}
