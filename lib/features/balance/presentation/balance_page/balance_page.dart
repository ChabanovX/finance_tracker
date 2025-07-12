import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:yndx_homework/features/balance/providers.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_app_bar.dart';
import 'package:yndx_homework/shared/presentation/widgets/default_header_list_tile.dart';
import 'package:yndx_homework/util/theme/app_theme.dart';

part 'balance_widgets.dart';

class BalancePage extends ConsumerWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Мой счет',
        actions: [
          IconButton(
            onPressed: () => _showBalanceEditor(context: context, ref: ref),
            padding: EdgeInsets.all(12),
            icon: Icon(Icons.mode_edit_outlined, size: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          _BalanceHeader(
            key: Key('balance_header'),
            onEdit: () => _showBalanceEditor(context: context, ref: ref),
          ),
          const _ChartModeSwitch(),
          const Expanded(child: _BalanceChart()),
        ],
      ),
    );
  }

  Future<void> _showBalanceEditor({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final ctrl = ref.watch(balanceProvider);

    final controller = TextEditingController(
      text: ctrl.amount.toStringAsFixed(2),
    );

    final newVal = await showDialog<double>(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Изменить баланс'),
            content: TextField(
              controller: controller,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
                decimal: true,
              ),
              decoration: InputDecoration(
                prefixText: '${ctrl.currency} ',
                border: const OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Отмена'),
              ),
              TextButton(
                onPressed: () {
                  final v = double.tryParse(
                    controller.text.replaceAll(',', '.'),
                  );
                  Navigator.pop(ctx, v);
                },
                child: const Text('Сохранить'),
              ),
            ],
          ),
    );

    if (newVal != null) {
      ref.read(balanceProvider.notifier).setAmount(newVal);
    }
  }
}
