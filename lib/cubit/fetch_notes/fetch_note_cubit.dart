import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constant/storage_data.dart';
import '../../models/note_model.dart';
import 'package:hive/hive.dart';
import 'fetch_note_state.dart';

class FetchNoteCubit extends Cubit<FetchNoteState> {
  FetchNoteCubit() : super(FetchNoteInitial());
  List<NoteModel> notes = [];

  void fetchAllNotes() {
    notes = Hive.box<NoteModel>(knotesBox).values.toList();
    emit(FetchNoteSeccuss());
  }
}
