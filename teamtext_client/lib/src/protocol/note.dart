/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'package:serverpod_auth_client/module.dart' as _i2;

abstract class Note extends _i1.SerializableEntity {
  Note._({
    this.id,
    required this.text,
    required this.createdById,
    this.createdBy,
  });

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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  int createdById;

  _i2.UserInfo? createdBy;

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
