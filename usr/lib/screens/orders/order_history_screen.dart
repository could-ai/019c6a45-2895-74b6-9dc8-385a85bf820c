import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Pending', 'Shipped', 'Delivered', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: Column(
        children: [
          // Filter Tabs
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _filters.map((filter) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: _selectedFilter == filter,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            _selectedFilter = filter;
                          });
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          // Orders List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildOrderCard(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(int index) {
    final statuses = ['Pending', 'Processing', 'Shipped', 'Delivered', 'Cancelled'];
    final statusColors = {
      'Pending': Colors.orange,
      'Processing': Colors.blue,
      'Shipped': Colors.purple,
      'Delivered': const Color(0xFF067D62),
      'Cancelled': Colors.red,
    };

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${1000 + index}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColors[statuses[index % statuses.length]]!.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    statuses[index % statuses.length],
                    style: TextStyle(
                      color: statusColors[statuses[index % statuses.length]],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Ordered on ${DateTime.now().subtract(Duration(days: index)).toString().split(' ')[0]}',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            // Order Items
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.image, size: 30),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Qty: 1',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Text(
                  '₹${99.99 + index * 10}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (index > 0) ...[
              const SizedBox(height: 8),
              Text(
                '+ ${index} more item${index > 1 ? 's' : ''}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
            const SizedBox(height: 16),
            const Divider(),
            // Order Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹${(99.99 + index * 10).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: View order details
                    },
                    child: const Text('View Details'),
                  ),
                ),
                if (statuses[index % statuses.length] == 'Delivered') ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Reorder
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Reorder placed!')),
                        );
                      },
                      child: const Text('Reorder'),
                    ),
                  ),
                ],
                if (statuses[index % statuses.length] == 'Shipped') ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Track order
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tracking information coming soon!')),
                        );
                      },
                      child: const Text('Track Order'),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}