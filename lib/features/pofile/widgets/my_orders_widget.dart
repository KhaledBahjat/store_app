import 'package:flutter/material.dart';
import 'package:store_app/core/theme/app_colors.dart';

class MyOrdersWidget extends StatelessWidget {
  const MyOrdersWidget({super.key});

  static const List<_OrderModel> _orders = [
    _OrderModel(
      id: '#ORD-1042',
      date: 'Mar 12, 2026',
      itemCount: 3,
      total: 149.98,
      status: OrderStatus.delivered,
    ),
    _OrderModel(
      id: '#ORD-1037',
      date: 'Mar 10, 2026',
      itemCount: 1,
      total: 49.99,
      status: OrderStatus.shipping,
    ),
    _OrderModel(
      id: '#ORD-1028',
      date: 'Mar 3, 2026',
      itemCount: 2,
      total: 89.50,
      status: OrderStatus.processing,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'My Orders',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'Track your recent purchases',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _orders.isEmpty
                  ? const _EmptyOrdersState()
                  : ListView.separated(
                      itemCount: _orders.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final order = _orders[index];
                        return _OrderCard(order: order);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({required this.order});

  final _OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.kBordersideColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order.id,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              _OrderStatusChip(status: order.status),
            ],
          ),
          const SizedBox(height: 8),
          Text(order.date, style: TextStyle(color: Colors.grey.shade700)),
          const SizedBox(height: 6),
          Text(
            '${order.itemCount} ${order.itemCount == 1 ? 'item' : 'items'}',
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${order.total.toStringAsFixed(2)}',
            style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 17,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderStatusChip extends StatelessWidget {
  const _OrderStatusChip({required this.status});

  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final data = _statusData(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: data.background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        data.label,
        style: TextStyle(
          color: data.foreground,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _EmptyOrdersState extends StatelessWidget {
  const _EmptyOrdersState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long_outlined,
            color: Colors.grey.shade500,
            size: 48,
          ),
          const SizedBox(height: 10),
          const Text(
            'No orders yet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6),
          Text(
            'Your completed purchases will show up here.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

enum OrderStatus { delivered, shipping, processing }

({String label, Color background, Color foreground}) _statusData(
  OrderStatus status,
) {
  switch (status) {
    case OrderStatus.delivered:
      return (
        label: 'Delivered',
        background: const Color(0xFFE6F6EC),
        foreground: const Color(0xFF1B8C48),
      );
    case OrderStatus.shipping:
      return (
        label: 'Shipping',
        background: const Color(0xFFE8F0FF),
        foreground: const Color(0xFF2F5ED8),
      );
    case OrderStatus.processing:
      return (
        label: 'Processing',
        background: const Color(0xFFFFF4E5),
        foreground: const Color(0xFFD57A00),
      );
  }
}

class _OrderModel {
  const _OrderModel({
    required this.id,
    required this.date,
    required this.itemCount,
    required this.total,
    required this.status,
  });

  final String id;
  final String date;
  final int itemCount;
  final double total;
  final OrderStatus status;
}
