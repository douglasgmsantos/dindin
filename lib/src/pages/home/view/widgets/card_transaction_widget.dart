import 'package:dindin/src/utils/formatValue.dart';
import 'package:flutter/material.dart';

class CardTransactionWidget extends StatelessWidget {
  CardTransactionWidget({super.key});

  final FormatValue formatValue = FormatValue();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: double.maxFinite,
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
                          const Expanded(
                            child: Text(
                              "Nome da categoria",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),

                          //Valor
                          Text(
                            formatValue.priceToCurrency(10000),
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
                          const Expanded(
                            flex: 2,
                            child: Text(
                              "Aqui vai ficar uma descrição que talvez seja extremamente gigante e eu preciso cuidar disso",
                              style: TextStyle(
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
                                DateTime.now(),
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
    );
  }
}
