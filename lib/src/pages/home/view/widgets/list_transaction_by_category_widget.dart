import 'package:dindin/src/core/services/transaction/model/transaction_model.dart';
import 'package:dindin/src/utils/format_value.dart';
import 'package:flutter/material.dart';

class ListTransactionByCategory extends StatelessWidget {
  const ListTransactionByCategory({
    super.key,
    required this.transactions,
  });

  final List<TransactionModel> transactions;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Container(
        height: 85,
        width: mediaQuery.width,
        margin: const EdgeInsets.only(
          top: 16,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            TransactionModel transactionModel = transactions[index];
            return CardTransaction(transaction: transactionModel);
          },
        ));
  }
}

class CardTransaction extends StatelessWidget {
  CardTransaction({
    super.key,
    required this.transaction,
  });

  final TransactionModel transaction;

  final FormatValue formatValue = FormatValue();

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: mediaQuery.width / 2,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      "💳",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Text(
                      transaction.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    formatValue.priceToCurrency(transaction.value),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          Icon(
            transaction.type == "outcome"
                ? Icons.arrow_circle_down_outlined
                : Icons.arrow_circle_up_outlined,
            size: 30,
            color: transaction.type == "outcome" ? Colors.red : Colors.green,
          )
        ],
      ),
    );
  }
}
