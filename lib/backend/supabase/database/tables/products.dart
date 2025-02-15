import '../database.dart';

class ProductsTable extends SupabaseTable<ProductsRow> {
  @override
  String get tableName => 'products';

  @override
  ProductsRow createRow(Map<String, dynamic> data) => ProductsRow(data);
}

class ProductsRow extends SupabaseDataRow {
  ProductsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProductsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get sellerId => getField<String>('seller_id')!;
  set sellerId(String value) => setField<String>('seller_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double get price => getField<double>('price')!;
  set price(double value) => setField<double>('price', value);

  int get stock => getField<int>('stock')!;
  set stock(int value) => setField<int>('stock', value);

  String? get category => getField<String>('category');
  set category(String? value) => setField<String>('category', value);

  String? get images => getField<String>('images');
  set images(String? value) => setField<String>('images', value);
}
