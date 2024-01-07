import 'package:hive_flutter/adapters.dart';
import '../../constant/storage_data.dart';
import '../../models/note_model.dart';
import '../../constant/colors.dart';
import 'package:bloc/bloc.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  int selectedColorIndex = 0;

  addNote(NoteModel note) async {
    note.color = kItemColors[selectedColorIndex].value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(knotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  void updateSelectedColor() {
    emit(AddNoteUpdate());
  }
}
