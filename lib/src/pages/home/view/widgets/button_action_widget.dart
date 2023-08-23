import 'package:flutter/material.dart';

enum ButtonActionType {
  income(
    name: "income",
    description: "Recebidos",
    color: Colors.green,
    icon: Icons.arrow_circle_up,
  ),
  outcome(
    name: "outcome",
    description: "A pagar",
    color: Colors.red,
    icon: Icons.arrow_circle_down,
  ),
  balance(
    name: "balance",
    description: "Saldo em carteira",
    color: Colors.yellow,
    icon: Icons.wallet,
  );

  final String name;
  final String description;
  final Color color;
  final IconData icon;

  const ButtonActionType({
    required this.name,
    required this.description,
    required this.color,
    required this.icon,
  });
}

class ButtonActionWidget extends StatelessWidget {
  const ButtonActionWidget(
      {super.key,
      required this.type,
      required this.onChanged,
      this.selected = false});

  final ButtonActionType type;
  final VoidCallback onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: InkWell(
        onTap: onChanged,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          padding: const EdgeInsets.all(8),
          height: 50,
          decoration: BoxDecoration(
            color: type.color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: !selected
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              if (!selected)
                Text(
                  type.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              Icon(color: Colors.black, type.icon),
            ],
          ),
        ),
      ),
    );
  }
}
