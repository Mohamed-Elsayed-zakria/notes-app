import '../../cubit/fetch_notes/fetch_note_cubit.dart';
import '../../cubit/fetch_notes/fetch_note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import 'custom_note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<FetchNoteCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNoteCubit, FetchNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<FetchNoteCubit>(context).notes;
        return notes.isNotEmpty
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                child: ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (context, index) => CustomNoteItem(
                    noteItem: notes[index],
                  ),
                ),
              )
            : const Center(
                child: Text(
                  "There are no notes yet",
                  style: TextStyle(fontSize: 18),
                ),
              );
      },
    );
  }
}
