import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:genesis_packaging_v1/widget/shadow_appbar_button.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class StockItems extends StatelessWidget {
  const StockItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCanvasColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShadowAppBarButton(
                    icon: FontAwesomeIcons.arrowLeft,
                    onClicked: () => Navigator.of(context).pop(),
                  ),
                  ShadowAppBarButton(
                    icon: FontAwesomeIcons.plus,
                    onClicked: () =>
                        Navigator.of(context).pushNamed('/stockEditScreen'),
                  ),
                ],
              ),
              Text(
                'All Products',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              Text(
                '23 Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                  color: kGreyColor,
                ),
              ),
              // StockList(),
            ],
          ),
        ),
      ),
    );
  }
}

class StockList extends StatelessWidget {
  Future<void> _refreshProducts(BuildContext context) async {
    try {
      await Provider.of<StockProvider>(context, listen: false)
          .fetchAndSetProducts(true);
    } catch (error) {
      // Fluttertoast.showToast(
      //   msg: 'No Products Added Yet',
      //   fontSize: 12,
      //   //backgroundColor: HexColor('#E2E0DF'),
      //   textColor: Theme.of(context).errorColor,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _refreshProducts(context),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<StockProvider>(
                  builder: (ctx, productData, _) => Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      itemCount: productData.items.length,
                      itemBuilder: (_, i) => Column(
                        children: [
                          // UserProductItem(
                          //   id: productData.items[i].id!,
                          //   title: productData.items[i].title!,
                          //   imageUrl: productData.items[i].imageUrl,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
