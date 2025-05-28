import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../utils/utils.dart';
import 'new_order_card.dart';
import 'ongoing_order_card.dart';


class OrderList extends StatelessWidget {
  final controller = Get.find<OrderController>();

  OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.hpmm(context)),
      child: Obx(() => controller.changeOrder.value == "New Orders"
          ? _NewOrdersList()
          : _OngoingOrdersList()),
    );
  }
}

class _NewOrdersList extends StatelessWidget {
  final List<Map<String, String>> orders = [
    {"name": "Abdullah", "number": "124353"},
    {"name": "Fahd", "number": "234545"},
    {"name": "Mohammed", "number": "735426"},
  ];

  _NewOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: orders
          .asMap()
          .entries
          .map((entry) => Column(
        children: [
          NewOrderCard(
            index: entry.key,
            name: entry.value["name"]!,
            number: entry.value["number"]!,
          ),
          SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
        ],
      ))
          .toList(),
    );
  }
}

class _OngoingOrdersList extends StatelessWidget {
  final controller = Get.find<OrderController>();

  _OngoingOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OngoingOrderCard(index: 0, name: "Abdullah", number: "124353"),
        SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
        OngoingOrderCard(index: 1, name: "Abdullah", number: "124353"),
        SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
        OngoingOrderCard(index: 2, name: "Abdullah", number: "124353"),
        SpacerWidget.spacerWidget(spaceHeight: 16.hm(context)),
      ],
    );
  }
}