import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ykapay/models/product_model.dart';

class ProductDatabase {
  static final ProductDatabase instance = ProductDatabase._init();

  static Database? _database;
  ProductDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('products.db');

    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final typeInt = 'INTEGER NOT NULL';
    final typeString = 'STRING NOT NULL';
    final typeNull = 'NULL';

    await db.execute('''
      CREATE TABLE $tableProducts(
        ${ProductFields.id} $idType,
        ${ProductFields.name} $typeString,
        ${ProductFields.image} $typeString,
        ${ProductFields.interest} $typeString,
        ${ProductFields.isHot} $typeInt,
        ${ProductFields.isNew} $typeInt,
        ${ProductFields.categoryId} $typeInt,
        ${ProductFields.createdAt} $typeNull,
        ${ProductFields.updatedAt} $typeNull
      );
    ''');
  }

  Future<ProductModel> create(ProductModel product) async {
    final db = await instance.database;
    final json = product.toJson();
    final columns = '${ProductFields.id}, ${ProductFields.name}, ${ProductFields.image}, ${ProductFields.interest}, ${ProductFields.categoryId}, ${ProductFields.isHot}, ${ProductFields.isNew}, ${ProductFields.createdAt}, ${ProductFields.updatedAt}';
    final values = '${json[ProductFields.id]},"${json[ProductFields.name]}","${json[ProductFields.image]}","${json[ProductFields.interest]}",${json[ProductFields.categoryId]},${json[ProductFields.isHot]},${json[ProductFields.isNew]},${json[ProductFields.createdAt]},${json[ProductFields.updatedAt]}';
    final id = await db!.rawInsert('INSERT INTO $tableProducts ($columns) VALUES ($values)');

    // final id = await db?.insert(tableProducts, product.toJson());
    return product.copy(id: id);
  }

  Future<ProductModel> readProduct(int id) async {
    final db = await instance.database;
    final maps = await db!.query(
      tableProducts,
      columns: ProductFields.values,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ProductModel.fromJson(maps.first);
    } else {
      throw Exception('Not found');
    }
  }

  Future<List<ProductModel>> readAllProduct() async {
    final db = await instance.database;
    // final orderBy = '`${ProductFields.id}` ASC';
    final result = await db!.rawQuery('SELECT * FROM $tableProducts');
    return result.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<int> update(ProductModel product) async {
    final db = await instance.database;

    return db!.update(
      tableProducts,
      product.toJson(),
      where: '${ProductFields.id} = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db!.delete(
      tableProducts,
      where: '${ProductFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAll() async {
    final db = await instance.database;

    await db!.rawQuery('DELETE FROM $tableProducts');
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }
}
