import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';
import 'package:teamtext_server/src/generated/protocol.dart';

class NotesEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<void> createNote(Session session, Note note) async {
    var userId = await session.auth.authenticatedUserId;
    if (userId != note.createdById) {
      throw FormatException('User mismatch');
    }
    await Note.db.insertRow(session, note);
  }

  Future<List<Note>> getAllNotes(Session session) async {
    var notes = await Note.db.find(
      session,
      orderBy: (note) => note.id,
      include: Note.include(
        createdBy: UserInfo.include(),
      ),
    );
    return notes;
  }

  Future<void> deleteNote(Session session, Note note) async {
    await Note.db.deleteRow(session, note);
  }
}
