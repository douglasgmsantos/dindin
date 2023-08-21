import 'package:dindin/src/pages/home/view/widgets/button_action_widget.dart';
import 'package:flutter/material.dart';

class ListTypeTransactionWidget extends StatelessWidget {
  const ListTypeTransactionWidget({
    super.key,
    required this.typeSelected,
    required this.onChanged,
  });

  final ButtonActionType typeSelected;
  final void Function(ButtonActionType) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        inputDecorationTheme: const InputDecorationTheme(
          outlineBorder: BorderSide(width: 0),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
        initialSelection: typeSelected,
        onSelected: (value) {
          onChanged(value!);
        },
        dropdownMenuEntries: List.of([
          ButtonActionType.balance,
          ButtonActionType.income,
          ButtonActionType.outcome,
        ])
            .map(
              (type) => DropdownMenuEntry<ButtonActionType>(
                leadingIcon: Icon(type.icon),
                value: type,
                label: type.description,
              ),
            )
            .toList());

    // return Row(
    //   children: List.of([
    //     ButtonActionType.balance,
    //     ButtonActionType.income,
    //     ButtonActionType.outcome,
    //   ])
    //       .map((type) => Expanded(
    //             flex: typeSelected == type ? 1 : 2,
    //             child: ButtonActionWidget(
    //               selected: typeSelected == type,
    //               type: type,
    //               onChanged: () => onChanged(type),
    //             ),
    //           ))
    //       .toList(),
    // );
  }
}
