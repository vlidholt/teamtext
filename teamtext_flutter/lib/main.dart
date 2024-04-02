import 'package:flutter/material.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:teamtext_client/teamtext_client.dart';

import 'loading_screen.dart';
import 'note_dialog.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
final client = Client(
  'http://localhost:8080/',
  authenticationKeyManager: FlutterAuthenticationKeyManager(),
)..connectivityMonitor = FlutterConnectivityMonitor();

final sessionManager = SessionManager(
  caller: client.modules.auth,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SigninPage(),
    );
  }
}

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  void initState() {
    super.initState();

    sessionManager.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return sessionManager.isSignedIn
        ? const NotesPage()
        : Scaffold(
            body: Center(
              child: SignInWithEmailButton(
                caller: client.modules.auth,
              ),
            ),
          );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // This field holds the list of notes that we've received from the server or
  // null if no notes have been received yet.
  List<Note>? _notes;

  // If the connection to the server fails, this field will hold the exception
  // that was thrown.
  Exception? _connectionException;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    try {
      final notes = await client.notes.getAllNotes();
      setState(() {
        _notes = notes;
      });
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _deleteNote(Note note) async {
    try {
      await client.notes.deleteNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _createNote(Note note) async {
    try {
      await client.notes.createNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _updateNote(Note note) async {
    try {
      await client.notes.updateNote(note);
      await _loadNotes();
    } catch (e) {
      _connectionFailed(e);
    }
  }

  void _connectionFailed(dynamic exception) {
    // If the connection to the server fails, we clear the list of notes and
    // store the exception that was thrown. This will make the loading screen
    // appear and show a button to try again.

    // In a real app you would probably want to do more complete error handling.
    setState(() {
      _notes = null;
      _connectionException = exception;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeamText'),
        actions: [
          IconButton(
            onPressed: _loadNotes,
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: _notes == null
          ? LoadingScreen(
              exception: _connectionException,
              onTryAgain: _loadNotes,
            )
          : ListView.builder(
              itemCount: _notes!.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(_notes![index].text),
                  onTap: () {
                    // When we tap a list tile we want to show a dialog where
                    // we can edit the note.
                    showNoteDialog(
                      context: context,
                      text: _notes![index].text,
                      onSaved: (text) {
                        // We lazily update the note in the list of notes before
                        // we've received a response from the server which makes
                        // the UI feel more responsive.
                        setState(() {
                          _notes![index].text = text;
                        });

                        // Actually update the note on the server.
                        _updateNote(
                          _notes![index],
                        );
                      },
                    );
                  },
                  leading: CircularUserImage(
                    userInfo: _notes![index].createdBy,
                    size: 32,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // Get the note that we want to delete.
                      var note = _notes![index];

                      // We lazily remove the note from the list of notes before
                      // we've received a response from the server which makes
                      // the UI feel more responsive.
                      setState(() {
                        _notes!.remove(note);
                      });

                      // Actually delete the note from the server.
                      _deleteNote(note);
                    },
                  ),
                );
              }),
            ),
      floatingActionButton: _notes == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                // When we tap the floating action button we want to show a
                // dialog where we can create a new note.
                showNoteDialog(
                  context: context,
                  onSaved: (text) {
                    var note = Note(
                      text: text,
                      createdById: sessionManager.signedInUser!.id!,
                    );

                    // Add the note to the list of notes before we've received
                    // a response from the server which makes the UI feel more
                    // responsive.
                    _notes!.add(note);

                    // Actually create the note on the server.
                    _createNote(note);
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}
