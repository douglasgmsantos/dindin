import 'package:dindin/src/pages/home/view/widgets/button_action_widget.dart';
import 'package:flutter/material.dart';

class ListWalletsWidget extends StatelessWidget {
  const ListWalletsWidget({
    super.key,
    required this.typeSelected,
    required this.onChanged,
  });

  final ButtonActionType typeSelected;
  final void Function(ButtonActionType) onChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              "Resumo da Carteira",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: DropdownMenu(
                inputDecorationTheme: const InputDecorationTheme(
                  constraints: BoxConstraints(
                    maxWidth: 190,
                  ),
                  outlineBorder: BorderSide(width: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
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
                    .toList()),
          ),
        ],
      ),
    );
  }
}
