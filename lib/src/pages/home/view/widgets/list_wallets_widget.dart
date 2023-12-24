import 'package:dindin/src/core/services/wallet/model/wallet_model.dart';
import 'package:flutter/material.dart';

class ListWalletsWidget extends StatelessWidget {
  const ListWalletsWidget({
    super.key,
    required this.walletSelected,
    required this.wallets,
    required this.onChanged,
  });

  final WalletModel walletSelected;
  final List<WalletModel> wallets;
  final void Function(WalletModel) onChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        underline: const SizedBox(),
        isExpanded: true,
        value: walletSelected.uid,
        onChanged: (value) {
          // onChanged(value!);
        },
        items: wallets
            .map(
              (wallet) => DropdownMenuItem<String>(
                value: wallet.uid,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(wallet.name),
                    const Icon(Icons.wallet),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
