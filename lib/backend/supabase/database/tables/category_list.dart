import '../database.dart';

class CategoryListTable extends SupabaseTable<CategoryListRow> {
  @override
  String get tableName => 'category_list';

  @override
  CategoryListRow createRow(Map<String, dynamic> data) => CategoryListRow(data);
}

class CategoryListRow extends SupabaseDataRow {
  CategoryListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CategoryListTable();

  String get category => getField<String>('category')!;
  set category(String value) => setField<String>('category', value);

  dynamic? get images => getField<dynamic>('images');
  set images(dynamic? value) => setField<dynamic>('images', value);
}
