import 'package:dindin/src/core/services/transaction/model/transaction_model.dart';
import 'package:dindin/src/pages/home/view/widgets/card_transaction_widget.dart';
import 'package:flutter/material.dart';

class ListTransactionsRecents extends StatelessWidget {
  const ListTransactionsRecents({
    super.key,
    required this.transactions,
  });

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (transactions.isEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Não há movimentações cadastradas para essa carteira.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                if (transactions.isNotEmpty) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Movimentações",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.list)
                      ],
                    ),
                  ),
                  Column(
                    children: transactions
                        .map(
                          (transaction) => CardTransactionWidget(
                            transaction: transaction,
                          ),
                        )
                        .toList(),
                  ),
                ]
              ],
            ),
          ),
        )
      ],
    );
  }
}
