import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'item_tile.dart';

class StockItemTile extends StatelessWidget {
  Future<void> fetchAllProducts(context) async {
    try {
      await Provider.of<StockProvider>(context).fetchAndSetProducts();
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<StockProvider>(context);
    return RefreshIndicator(
      onRefresh: () => fetchAllProducts(context),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 3 / 4,
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
