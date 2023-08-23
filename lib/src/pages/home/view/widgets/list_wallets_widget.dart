import 'package:flutter/material.dart';

class ListWalletsWidget extends StatelessWidget {
  const ListWalletsWidget({
    super.key,
    required this.typeSelected,
    required this.onChanged,
  });

  final String typeSelected;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
          underline: const SizedBox(),
          isExpanded: true,
          value: typeSelected,
          onChanged: (value) {
            onChanged(value!);
          },
          items: List.of(["Principal"])
              .map(
                (wallet) => DropdownMenuItem<String>(
                  value: wallet,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(wallet),
                      const Icon(Icons.wallet),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
