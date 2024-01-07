import '../cubit/fetch_notes/fetch_note_cubit.dart';
import 'widgets/custom_list_view_color_update.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/custom_appbar_icon.dart';
import 'widgets/custom_text_faild.dart';
import 'package:flutter/material.dart';
import '../models/note_model.dart';

TextEditingController noteTitleController = TextEditingController();
TextEditingController noteSubTitleController = TextEditingController();

class EditNoteView extends StatelessWidget {
  final NoteModel noteItem;
  const EditNoteView({
    super.key,
    required this.noteItem,
  });

  @override
  Widget build(BuildContext context) {
    noteTitleController.text = noteItem.title;
    noteSubTitleController.text = noteItem.subTitle;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          CustomAppbarIcon(
            icon: Icons.check_sharp,
            onPressed: () {
              noteItem.title = noteTitleController.text;
              noteItem.subTitle = noteSubTitleController.text;
              noteItem.save();
              BlocProvider.of<FetchNoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFaild(
                controller: noteTitleController,
                title: 'title',
              ),
              CustomTextFaild(
                controller: noteSubTitleController,
                title: 'content',
                maxLines: 10,
              ),
              CustomListViewColorsUpdate(noteModel: noteItem),
            ],
          ),
        ),
      ),
    );
  }
}
