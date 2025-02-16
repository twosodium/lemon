import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get accountType => getField<String>('account-type');
  set accountType(String? value) => setField<String>('account-type', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get intro => getField<String>('intro');
  set intro(String? value) => setField<String>('intro', value);

  String? get fullname => getField<String>('fullname');
  set fullname(String? value) => setField<String>('fullname', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  List<String> get produce => getListField<String>('produce');
  set produce(List<String>? value) => setListField<String>('produce', value);
}
