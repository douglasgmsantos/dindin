import 'package:dindin/src/core/dependency_injection/dependency_injection.dart';
import 'package:dindin/src/core/services/transaction/model/transaction_model.dart';
import 'package:dindin/src/pages/home/controller/home_controller.dart';
import 'package:dindin/src/utils/format_value.dart';
import 'package:flutter/material.dart';

class CardTransactionWidget extends StatelessWidget {
  CardTransactionWidget({
    super.key,
    required this.transaction,
  });

  final homeController = DindinInjector.I.get<HomeController>();

  final FormatValue formatValue = FormatValue();
  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Dismissible(
      key: Key(transaction.uid),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        homeController.deleteTransaction(uidTransaction: transaction.uid);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white30,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Categoria e valor
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Categoria
                            Expanded(
                              child: Text(
                                transaction.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),

                            //Valor
                            Text(
                              formatValue.priceToCurrency(transaction.value),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Descrição e data
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Descrição
                            Expanded(
                              flex: 2,
                              child: Text(
                                transaction.description,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white70,
                                ),
                              ),
                            ),

                            //Data
                            Expanded(
                              child: Text(
                                textDirection: TextDirection.rtl,
                                formatValue.formatDateTime(
                                  transaction.dtReference,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              color: Colors.grey,
              height: 0.5,
            )
          ],
        ),
      ),
    );
  }
}
