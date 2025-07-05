import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shake/shake.dart';
import 'package:yndx_homework/domain/models/transaction.dart';
import 'package:yndx_homework/presentation/providers.dart';

import 'package:yndx_homework/presentation/shared/default_app_bar.dart';
import 'package:yndx_homework/presentation/shared/default_header_list_tile.dart';
import 'package:yndx_homework/presentation/theme/app_theme.dart';

part 'balance_widgets.dart';
part 'balance_controller.dart';

class BalancePage extends ConsumerWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ctrl = ref.watch(_balanceProvider);

    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Мой счет',
        actions: [
          IconButton(
            onPressed: () => _showBalanceEditor(context: context, ctrl: ctrl),
            padding: EdgeInsets.all(12),
            icon: Icon(Icons.mode_edit_outlined, size: 24),
          ),
        ],
      ),
      body: Column(
        children: [
          _BalanceHeader(
            key: Key('balance_header'),
            onEdit: () => _showBalanceEditor(context: context, ctrl: ctrl),
          ),
          const _ChartModeSwitch(),
          const Expanded(child: _BalanceChart()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          color: context.colors.white,
          size: 15.56 * 2,
        ),
        onPressed: () {},
      ),
    );
  }

  Future<void> _showBalanceEditor({
    required BuildContext context,
    required _BalanceController ctrl,
  }) async {
    final controller = TextEditingController(
      text: ctrl.balance.toStringAsFixed(2),
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

    if (newVal != null) ctrl.setBalance(newVal);
  }
}
