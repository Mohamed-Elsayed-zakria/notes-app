import '../../cubit/fetch_notes/fetch_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../models/note_model.dart';
import '../../constant/colors.dart';
import 'custom_color_item.dart';

class CustomListViewColorsUpdate extends StatefulWidget {
  final NoteModel noteModel;
  const CustomListViewColorsUpdate({
    super.key,
    required this.noteModel,
  });

  @override
  State<CustomListViewColorsUpdate> createState() =>
      _CustomListViewColorsUpdateState();
}

class _CustomListViewColorsUpdateState
    extends State<CustomListViewColorsUpdate> {
  late int currentIndexColor;
  @override
  void initState() {
    currentIndexColor = kItemColors.indexOf(Color(widget.noteModel.color));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 5),
      height: 32 * 2,
      child: ListView.builder(
        itemCount: kItemColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndexColor = index;
              widget.noteModel.color = kItemColors[currentIndexColor].value;
              widget.noteModel.save();
              BlocProvider.of<FetchNoteCubit>(context).fetchAllNotes();
              setState(() {});
            },
            child: CustomColorItem(
              color: kItemColors[index],
              isActive: currentIndexColor == index,
            ),
          );
        },
      ),
    );
  }
}
