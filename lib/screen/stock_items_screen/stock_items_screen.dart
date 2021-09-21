import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:genesis_packaging_v1/widget/shadow_appbar_button.dart';
import 'package:genesis_packaging_v1/widget/shimmer_loading_widget.dart';
import 'package:genesis_packaging_v1/widget/stock_screen_widgets/stock_items.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';

class StockItems extends StatefulWidget {
  const StockItems({Key? key}) : super(key: key);

  @override
  State<StockItems> createState() => _StockItemsState();
}

class _StockItemsState extends State<StockItems> {
  Future<void> _refreshProducts(BuildContext context) async {
    try {
      await Provider.of<StockProvider>(context, listen: false)
          .fetchAndSetProducts();
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
    final productData = Provider.of<StockProvider>(context, listen: false);
    int? totalCount = productData.totalItems;
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
                style: kHeadStyle,
              ),
              Text(
                '${totalCount.toString()} Items',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                  color: kGreyColor,
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: _refreshProducts(context),
                  builder: (ctx, snapshot) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? buildShimmerLoading()
                          : Padding(
                              padding: EdgeInsets.all(8),
                              child: ListView.builder(
                                itemCount: productData.items.length,
                                itemBuilder: (_, i) {
                                  return Column(
                                    children: [
                                      StockItem(
                                        id: productData.items[i].id!,
                                        title: productData.items[i].title!,
                                        imageUrl: productData.items[i].imageUrl,
                                        type: productData.items[i].type,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildShimmerLoading() => ListTile(
        leading: ShimmerWidget.circular(
          width: 64,
          height: 64,
          shapeBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        title: ShimmerWidget.rectangular(height: 16),
        subtitle: ShimmerWidget.rectangular(height: 14),
      );
}
