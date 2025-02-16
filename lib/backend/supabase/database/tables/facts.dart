import '../database.dart';

class FactsTable extends SupabaseTable<FactsRow> {
  @override
  String get tableName => 'facts';

  @override
  FactsRow createRow(Map<String, dynamic> data) => FactsRow(data);
}

class FactsRow extends SupabaseDataRow {
  FactsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FactsTable();

  String? get fact => getField<String>('fact');
  set fact(String? value) => setField<String>('fact', value);
}
