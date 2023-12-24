import 'package:dindin/src/pages/home/view/widgets/card_transaction_widget.dart';
import 'package:flutter/material.dart';

class ListTransactionsRecents extends StatelessWidget {
  const ListTransactionsRecents({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Movimentações",
                      style: TextStyle(fontSize: 15),
                    ),
                    Icon(Icons.list)
                  ],
                ),
                Column(
                  children:
                      List.generate(10, (index) => CardTransactionWidget())
                          .toList(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
