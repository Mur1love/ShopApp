// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.order});

  final Order order;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    final _itemsHeigt = (widget.order.products.length * 25.0) + 10;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded ? _itemsHeigt + 80 : 80,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text("R\$ ${widget.order.total.toStringAsFixed(2)}"),
              subtitle: Text(
                DateFormat('dd/MM/yyy hh:mm').format(widget.order.date),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            AnimatedContainer(
              height: _expanded ? _itemsHeigt : 0,
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              child: ListView(
                children: widget.order.products.map(
                  (product) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${product.quantity}x R\$ ${product.price}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    );
                  },
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
