import 'package:dindin/src/pages/home/view/widgets/button_action_widget.dart';
import 'package:flutter/material.dart';

class ContainerPriceWithTypeWidget extends StatelessWidget {
  const ContainerPriceWithTypeWidget(
      {super.key,
      required this.description,
      required this.value,
      required this.buttonActionType});

  final String description;
  final double value;
  final ButtonActionType buttonActionType;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description, style: const TextStyle(fontSize: 22)),
                  Text(value.toString(), style: const TextStyle(fontSize: 22)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: buttonActionType.color,
                    borderRadius: BorderRadius.circular(10)),
                child: ButtonActionWidget(
                    selected: true, type: buttonActionType, onChanged: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
