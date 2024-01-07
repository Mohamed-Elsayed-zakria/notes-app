import '../../cubit/fetch_notes/fetch_note_cubit.dart';
import '../../cubit/add_notes/add_note_cubit.dart';
import '../../cubit/add_notes/add_note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import 'custom_list_view_color.dart';
import '../../constant/colors.dart';
import 'custom_text_faild.dart';
import 'custom_button.dart';

TextEditingController? titleController = TextEditingController();
TextEditingController? subTitleController = TextEditingController();
GlobalKey<FormState> formState = GlobalKey();

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      width: double.infinity,
      child: BlocProvider<AddNoteCubit>(
        create: (context) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          builder: (context, state) => SingleChildScrollView(
            child: Form(
              key: formState,
              child: Column(
                children: [
                  CustomTextFaild(
                    controller: titleController,
                    title: 'title',
                  ),
                  CustomTextFaild(
                    controller: subTitleController,
                    title: 'content',
                    maxLines: 6,
                  ),
                  const CustomListViewColors(),
                  CustomButton(
                    isLoading: state is AddNoteLoading ? true : false,
                    onPressed: () {
                      if (formState.currentState!.validate()) {
                        NoteModel addNote = NoteModel(
                          title: titleController!.text,
                          subTitle: subTitleController!.text,
                          date: DateTime.now().toString(),
                          color: kItemColors[0].value,
                        );
                        BlocProvider.of<AddNoteCubit>(context).addNote(addNote);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              BlocProvider.of<FetchNoteCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              titleController!.clear();
              subTitleController!.clear();
            }
          },
        ),
      ),
    );
  }
}
