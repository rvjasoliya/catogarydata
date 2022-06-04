// ignore_for_file: constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/categorydatamodel.dart';

class DatabaseHelper {
  static final categoryTable = '$CategoryDataModel';
  static const _databaseName = "category.db";
  static const categoryId = "categoryId";
  static const nameenId = "nameenid";
  static const nameenLanguage = "nameenlanguage";
  static const nameenValue = "nameenvalue";
  static const nameguId = "nameguid";
  static const nameguLanguage = "namegulanguage";
  static const nameguValue = "nameguvalue";
  static const slug = "slug";
  static const description = "description";
  static const parentID = "parentID";
  static const type = "type";
  static const attributeSet = "attributeSet";
  static const categoryNumber = "categoryNumber";
  static const level = "level";
  static const featured = "featured";
  static const icon = "icon";
  static const image = "image";
  static const status = "status";
  static const create_date = "create_date";
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $categoryTable  (
            $categoryId TEXT PRIMARY KEY,
            $nameenId TEXT,
            $nameenLanguage TEXT,
            $nameenValue TEXT,
            $nameguId TEXT,
            $nameguLanguage TEXT,
            $nameguValue TEXT,
            $slug TEXT,
            $description TEXT,
            $type TEXT,
            $attributeSet TEXT,
            $categoryNumber TEXT,
            $level TEXT,
            $featured TEXT,
            $icon TEXT,
            $image TEXT,
            $status TEXT,
            $create_date TEXT
          )
          ''');
  }

  Future<void> categoryInsertAll(CategoryDataModel model) async {
    Database? db = await instance.database;
    String value =
        '''INSERT OR REPLACE INTO $categoryTable("$categoryId","$nameenId","$nameenLanguage","$nameenValue","$nameguId","$nameguLanguage","$nameguValue","$slug","$description"
        ,"$type","$attributeSet","$categoryNumber","$level","$featured","$icon","$image","$status","$create_date") VALUES''';

    for (int i = 0; i < model.data!.length; i++) {
      Data object=model.data![i];
      if (i == model.data!.length - 1) {
        value +=
            '("${object.categoryId}","${object.name![0].sId}","${object.name![0].language}","${object.name![0].value}","${object.name![1].sId}","${object.name![1].language}","${object.name![1].value}","${object.slug}","${object.description},"${object.type},"${object.attributeSet},"${object.categoryNumber},"${object.level},"${object.featured},"${object.icon},"${object.image},"${object.status},"${object.createDate}")';
      } else {
        value +=
            '("${object.categoryId}","${object.name![0].sId}","${object.name![0].language}","${object.name![0].value}","${object.name![1].sId}","${object.name![1].language}","${object.name![1].value}","${object.slug}","${object.description},"${object.type},"${object.attributeSet},"${object.categoryNumber},"${object.level},"${object.featured},"${object.icon},"${object.image},"${object.status},"${object.createDate}"),';
      }
    }
    var result = await db!.rawInsert(value);
    if (kDebugMode) {
      print(result);
    }
  }

  Future<List<Data>> getCategoryById(String categoryid) async {
    List<Data> list=[];
    final db = await database;
    //List<State> statelist = [];
    //int i=await db.getVersion();

      var res = await db!.rawQuery("SELECT * FROM $categoryTable WHERE id = '$categoryid'");
      if(res!=null && res.length>0)
      {
        for(int i=0;i<res.length;i++)
          {
            list.add(Data.fromJson(res[i]));
          }
        return list;
      }
    return [];
  }

  Future<void> customcategoryInsert(Data object) async {
    Database? db = await instance.database;
    String value =
    '''INSERT OR REPLACE INTO $categoryTable("$categoryId","$nameenId","$nameenLanguage","$nameenValue","$nameguId","$nameguLanguage","$nameguValue","$slug","$description"
        ,"$type","$attributeSet","$categoryNumber","$level","$featured","$icon","$image","$status","$create_date") VALUES("${object.categoryId}",
        "${object.name![0].sId}","${object.name![0].language}","${object.name![0].value}","${object.name![1].sId}","${object.name![1].language}",
        "${object.name![1].value}","${object.slug}","${object.description},"${object.type},"${object.attributeSet},"${object.categoryNumber},"${object.level},
        "${object.featured},"${object.icon},"${object.image},"${object.status},"${object.createDate}")''';
    var result = await db!.rawInsert(value);
  }

}
