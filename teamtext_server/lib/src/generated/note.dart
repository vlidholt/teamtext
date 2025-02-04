/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/module.dart' as _i2;

abstract class Note extends _i1.TableRow {
  Note._({
    int? id,
    required this.text,
    required this.createdById,
    this.createdBy,
  }) : super(id);

  factory Note({
    int? id,
    required String text,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) = _NoteImpl;

  factory Note.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Note(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      createdById: serializationManager
          .deserialize<int>(jsonSerialization['createdById']),
      createdBy: serializationManager
          .deserialize<_i2.UserInfo?>(jsonSerialization['createdBy']),
    );
  }

  static final t = NoteTable();

  static const db = NoteRepository._();

  String text;

  int createdById;

  _i2.UserInfo? createdBy;

  @override
  _i1.Table get table => t;

  Note copyWith({
    int? id,
    String? text,
    int? createdById,
    _i2.UserInfo? createdBy,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'text': text,
      'createdById': createdById,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'text': text,
      'createdById': createdById,
      if (createdBy != null) 'createdBy': createdBy?.allToJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'text':
        text = value;
        return;
      case 'createdById':
        createdById = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<Note>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.db.find<Note>(
      where: where != null ? where(Note.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<Note?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.db.findSingleRow<Note>(
      where: where != null ? where(Note.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Note?> findById(
    _i1.Session session,
    int id, {
    NoteInclude? include,
  }) async {
    return session.db.findById<Note>(
      id,
      include: include,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Note>(
      where: where(Note.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Note>(
      where: where != null ? where(Note.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static NoteInclude include({_i2.UserInfoInclude? createdBy}) {
    return NoteInclude._(createdBy: createdBy);
  }

  static NoteIncludeList includeList({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    NoteInclude? include,
  }) {
    return NoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Note.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Note.t),
      include: include,
    );
  }
}

class _Undefined {}

class _NoteImpl extends Note {
  _NoteImpl({
    int? id,
    required String text,
    required int createdById,
    _i2.UserInfo? createdBy,
  }) : super._(
          id: id,
          text: text,
          createdById: createdById,
          createdBy: createdBy,
        );

  @override
  Note copyWith({
    Object? id = _Undefined,
    String? text,
    int? createdById,
    Object? createdBy = _Undefined,
  }) {
    return Note(
      id: id is int? ? id : this.id,
      text: text ?? this.text,
      createdById: createdById ?? this.createdById,
      createdBy:
          createdBy is _i2.UserInfo? ? createdBy : this.createdBy?.copyWith(),
    );
  }
}

class NoteTable extends _i1.Table {
  NoteTable({super.tableRelation}) : super(tableName: 'note') {
    text = _i1.ColumnString(
      'text',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
  }

  late final _i1.ColumnString text;

  late final _i1.ColumnInt createdById;

  _i2.UserInfoTable? _createdBy;

  _i2.UserInfoTable get createdBy {
    if (_createdBy != null) return _createdBy!;
    _createdBy = _i1.createRelationTable(
      relationFieldName: 'createdBy',
      field: Note.t.createdById,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _createdBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        createdById,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'createdBy') {
      return createdBy;
    }
    return null;
  }
}

@Deprecated('Use NoteTable.t instead.')
NoteTable tNote = NoteTable();

class NoteInclude extends _i1.IncludeObject {
  NoteInclude._({_i2.UserInfoInclude? createdBy}) {
    _createdBy = createdBy;
  }

  _i2.UserInfoInclude? _createdBy;

  @override
  Map<String, _i1.Include?> get includes => {'createdBy': _createdBy};

  @override
  _i1.Table get table => Note.t;
}

class NoteIncludeList extends _i1.IncludeList {
  NoteIncludeList._({
    _i1.WhereExpressionBuilder<NoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Note.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Note.t;
}

class NoteRepository {
  const NoteRepository._();

  final attachRow = const NoteAttachRowRepository._();

  Future<List<Note>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.dbNext.find<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Note?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<NoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<NoteTable>? orderByList,
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.dbNext.findFirstRow<Note>(
      where: where?.call(Note.t),
      orderBy: orderBy?.call(Note.t),
      orderByList: orderByList?.call(Note.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Note?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    NoteInclude? include,
  }) async {
    return session.dbNext.findById<Note>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Note>> insert(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Note>(
      rows,
      transaction: transaction,
    );
  }

  Future<Note> insertRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Note>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Note>> update(
    _i1.Session session,
    List<Note> rows, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Note>(
      rows,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  Future<Note> updateRow(
    _i1.Session session,
    Note row, {
    _i1.ColumnSelections<NoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Note>(
      row,
      columns: columns?.call(Note.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Note> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Note>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Note row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Note>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<NoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Note>(
      where: where(Note.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<NoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Note>(
      where: where?.call(Note.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class NoteAttachRowRepository {
  const NoteAttachRowRepository._();

  Future<void> createdBy(
    _i1.Session session,
    Note note,
    _i2.UserInfo createdBy,
  ) async {
    if (note.id == null) {
      throw ArgumentError.notNull('note.id');
    }
    if (createdBy.id == null) {
      throw ArgumentError.notNull('createdBy.id');
    }

    var $note = note.copyWith(createdById: createdBy.id);
    await session.dbNext.updateRow<Note>(
      $note,
      columns: [Note.t.createdById],
    );
  }
}
