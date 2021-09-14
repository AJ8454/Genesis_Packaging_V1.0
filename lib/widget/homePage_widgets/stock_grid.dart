import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';

import '../shimmer_loading_widget.dart';
import 'stock_item_tile.dart';

class StockGrid extends StatefulWidget {
  const StockGrid({Key? key}) : super(key: key);

  @override
  _StockGridState createState() => _StockGridState();
}

class _StockGridState extends State<StockGrid> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    fetchAllProducts();
    super.didChangeDependencies();
  }

  Future<void> fetchAllProducts() async {
    try {
      if (_isInit) {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<StockProvider>(context)
            .fetchAndSetProducts()
            .then((_) {
          setState(() {
            _isLoading = false;
          });
        }); // It work
      }
      _isInit = false;
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? buildShimmerLoading() : StockItemTile();
  }

  Widget buildShimmerLoading() => GridTile(
        header: ShimmerWidget.circular(
          width: 20,
          height: 20,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        footer: ShimmerWidget.rectangular(height: 16),
        child: ShimmerWidget.rectangular(height: 14),
      );
}
