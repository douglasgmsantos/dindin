import 'package:dindin/src/core/services/wallet/model/wallet_model.dart';
import 'package:dindin/src/utils/format_value.dart';
import 'package:flutter/material.dart';

class ContainerPriceWithTypeWidget extends StatelessWidget {
  const ContainerPriceWithTypeWidget({
    super.key,
    required this.walletSelected,
  });

  final WalletModel walletSelected;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    FormatValue formatValue = FormatValue();

    return Container(
      margin: const EdgeInsets.only(
        top: 16,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: 110,
              margin: const EdgeInsets.only(right: 10),
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
                          Text(
                            walletSelected.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.amber,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            formatValue.priceToCurrency(
                              walletSelected.balance,
                            ),
                            style: const TextStyle(fontSize: 22),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 110,
                child: Column(
                  children: [
                    LabelOutcomeIncome(
                      value: formatValue.priceToCurrency(
                        walletSelected.income,
                      ),
                      color: Colors.green,
                    ),
                    LabelOutcomeIncome(
                      value: formatValue.priceToCurrency(
                        walletSelected.outcome,
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class LabelOutcomeIncome extends StatelessWidget {
  const LabelOutcomeIncome(
      {super.key, required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
