import '../database.dart';

class CartsTable extends SupabaseTable<CartsRow> {
  @override
  String get tableName => 'carts';

  @override
  CartsRow createRow(Map<String, dynamic> data) => CartsRow(data);
}

class CartsRow extends SupabaseDataRow {
  CartsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CartsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  int? get productId => getField<int>('product_id');
  set productId(int? value) => setField<int>('product_id', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  String? get productName => getField<String>('product_name');
  set productName(String? value) => setField<String>('product_name', value);

  String? get producerName => getField<String>('producer_name');
  set producerName(String? value) => setField<String>('producer_name', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  double? get priceSum => getField<double>('price_sum');
  set priceSum(double? value) => setField<double>('price_sum', value);
}
