/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/notes_endpoint.dart' as _i2;
import 'package:teamtext_server/src/generated/note.dart' as _i3;
import 'package:serverpod_auth_server/module.dart' as _i4;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'notes': _i2.NotesEndpoint()
        ..initialize(
          server,
          'notes',
          null,
        )
    };
    connectors['notes'] = _i1.EndpointConnector(
      name: 'notes',
      endpoint: endpoints['notes']!,
      methodConnectors: {
        'createNote': _i1.MethodConnector(
          name: 'createNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i3.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i2.NotesEndpoint).createNote(
            session,
            params['note'],
          ),
        ),
        'getAllNotes': _i1.MethodConnector(
          name: 'getAllNotes',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i2.NotesEndpoint).getAllNotes(session),
        ),
        'deleteNote': _i1.MethodConnector(
          name: 'deleteNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i3.Note>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['notes'] as _i2.NotesEndpoint).deleteNote(
            session,
            params['note'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i4.Endpoints()..initializeEndpoints(server);
  }
}
