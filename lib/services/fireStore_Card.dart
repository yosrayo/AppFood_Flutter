import 'package:path/path.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
class CardDataBaseHelper {
  CardDataBaseHelper._();
  static final CardDataBaseHelper db = CardDataBaseHelper._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDb();
    return _database;
  }

  get columnName => null;

  initDb() async {
    String path = join(await getDatabasesPath(), 'card.db');
    return await openDatabase(path, version: 6,
        onCreate: (Database db, int version) async {
      await db.execute(''' 
    CREATE TABLE $tableCard(
        name TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnQuatity INTEGER,
      quantity INTEGER NOT NULL,
      $columnPrice INTEGER NOT NULL )
     ''');
    });
  }

  insert( CardModel model) async {
var dbClient = await database;
await dbClient!.insert(
  tableCard, 
  model.toJson(),
  conflictAlgorithm: ConflictAlgorithm.replace,
  );
  }

  Future <List<CardModel>> getAll() async{
    var dbClient = await database;
    List <Map> maps = await dbClient!.query(tableCard);

    List <CardModel> list = maps.isNotEmpty ? maps.map((e) => CardModel.fromJson(e)).toList() : [];

    return list;
  }
}
