import 'package:flutter/material.dart';

class ListTransactionsRecents extends StatelessWidget {
  const ListTransactionsRecents({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Suas ultimas movimentações",
                style: TextStyle(fontSize: 15),
              ),
              Icon(Icons.list)
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CardTransaction();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardTransaction extends StatelessWidget {
  const CardTransaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Item x",
      style: TextStyle(fontSize: 16),
    );
  }
}
