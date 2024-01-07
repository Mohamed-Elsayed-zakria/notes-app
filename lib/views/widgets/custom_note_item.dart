import '../../cubit/fetch_notes/fetch_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import '../../constant/colors.dart';
import 'package:intl/intl.dart';
import '../edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  final NoteModel noteItem;
  const CustomNoteItem({
    super.key,
    required this.noteItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditNoteView(noteItem: noteItem),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(noteItem.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.only(left: 18, right: 10),
              title: Text(
                noteItem.title,
                style: const TextStyle(fontSize: 24, color: ksecondColor),
                maxLines: 2,
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  noteItem.subTitle,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(.6),
                  ),
                  maxLines: 2,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  noteItem.delete();
                  BlocProvider.of<FetchNoteCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  size: 30,
                  color: ksecondColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                DateFormat('dd-mm-yyyy').format(DateTime.parse(noteItem.date)),
                style: TextStyle(
                  fontSize: 16,
                  color: ksecondColor.withOpacity(.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
