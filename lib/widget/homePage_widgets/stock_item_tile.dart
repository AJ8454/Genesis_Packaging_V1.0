import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';

import 'item_tile.dart';

class StockItemTile extends StatelessWidget {
  Future<void> fetchAllProducts(context) async {
    try {
      await Provider.of<StockProvider>(context).fetchAndSetProducts();
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productData = Provider.of<StockProvider>(context);
    return RefreshIndicator(
      onRefresh: () => fetchAllProducts(context),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3.5,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: productData.items.length,
        itemBuilder: (context, i) => ChangeNotifierProvider.value(
          value: productData.items[i],
          child: ItemTile(),
        ),
      ),
    );
  }
}
