import '../../cubit/add_notes/add_note_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import 'custom_color_item.dart';

class CustomListViewColors extends StatefulWidget {
  const CustomListViewColors({super.key});

  @override
  State<CustomListViewColors> createState() => _CustomListViewColorsState();
}

class _CustomListViewColorsState extends State<CustomListViewColors> {
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
              BlocProvider.of<AddNoteCubit>(context).selectedColorIndex = index;
              setState(() {});
            },
            child: CustomColorItem(
              color: kItemColors[index],
              isActive: index ==
                  BlocProvider.of<AddNoteCubit>(context).selectedColorIndex,
            ),
          );
        },
      ),
    );
  }
}
