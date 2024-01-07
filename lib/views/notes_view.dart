import 'widgets/add_note_button_sheet.dart';
import 'package:flutter/material.dart';
import 'widgets/notes_list_view.dart';
import '../constant/colors.dart';

class NotesViews extends StatelessWidget {
  const NotesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.add,
          color: ksecondColor,
        ),
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          context: context,
          builder: (context) => const AddNoteButtonSheet(),
        ),
      ),
      body: const NotesListView(),
    );
  }
}
