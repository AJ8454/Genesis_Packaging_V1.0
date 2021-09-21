import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/stock_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedData =
        Provider.of<StockProvider>(context, listen: false).findById(productId);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              Align(
                child: Column(
                  children: [
                    Container(
                      height: 20.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 26.0,
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Hero(
                        tag: Key(loadedData.id!),
                        child: Image.asset(
                          loadedData.imageUrl,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      loadedData.title!,
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              itemDetails('Rate : ', '\u{20B9} ${loadedData.rate}'),
              SizedBox(height: 15),
              itemDetails('Color : ', loadedData.color!),
              SizedBox(height: 15),
              itemDetails('Type : ', loadedData.type!),
              SizedBox(height: 15),
              itemDetails(
                  'Bal. Qty : ',
                  loadedData.quantity == 0
                      ? "Out of Stock"
                      : loadedData.quantity.toString()),
              SizedBox(height: 15),
              itemDetails('Supplier : ', loadedData.supplier!),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Text(
                      'Quantity ',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 6.h,
                      padding: EdgeInsets.only(left: 5.w, right: 5.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFD2D0D3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Provider.of<StockProvider>(context, listen: false)
                              //     .updateProduct(
                              //         productId,
                              //         Product(
                              //           id: productId,
                              //           size: product.size,
                              //           title: product.title,
                              //           type: product.type,
                              //           color: product.color,
                              //           dateTime: product.dateTime,
                              //           quantity: product.quantity! + 1,
                              //           gstNo: product.gstNo,
                              //           rate: product.rate,
                              //           supplier: product.supplier,
                              //         ))
                              //     .then((_) => Provider.of<CartProvider>(context,
                              //             listen: false)
                              //         .removeItem(productId));
                            },
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          Container(
                            width: 15.w,
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.white,
                            ),
                            child: Text(
                              '0',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Provider.of<ProductsProvider>(context, listen: false)
                              //     .updateProduct(
                              //         productId,
                              //         Product(
                              //           id: productId,
                              //           size: product.size,
                              //           title: product.title,
                              //           type: product.type,
                              //           color: product.color,
                              //           dateTime: product.dateTime,
                              //           quantity: product.quantity! - 1,
                              //           gstNo: product.gstNo,
                              //           rate: product.rate,
                              //           supplier: product.supplier,
                              //         ))
                              //     .then(
                              //       (_) => cart.increaseItemQuantity(
                              //           productId, price, title, imageUrl),
                              //     );
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 15.h,
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 25, right: 25),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Ink(
      //           decoration: const ShapeDecoration(
      //             shape: CircleBorder(),
      //           ),
      //           child: IconButton(
      //             icon: Icon(
      //               Icons.shopping_cart,
      //               color: Colors.red[900],
      //             ),
      //             iconSize: 30,
      //              onPressed: (){},
      //             // {
      //             //   cart.addItem(productId, loadedData.rate!, loadedData.title!,
      //             //       loadedData.imageUrl);
      //             //   Provider.of<ProductsProvider>(context, listen: false)
      //             //       .updateProduct(
      //             //           productId,
      //             //           Product(
      //             //             id: productId,
      //             //             size: loadedData.size,
      //             //             title: loadedData.title,
      //             //             type: loadedData.type,
      //             //             color: loadedData.color,
      //             //             dateTime: loadedData.dateTime,
      //             //             quantity: loadedData.quantity! - 1,
      //             //             gstNo: loadedData.gstNo,
      //             //             rate: loadedData.rate,
      //             //             supplier: loadedData.supplier,
      //             //           ))
      //             //       .then((_) => setState(() {
      //             //             // Fluttertoast.showToast(
      //             //             //   msg: '${loadedData.title!} added to cart',
      //             //             //   fontSize: 18.sp,
      //             //             //   backgroundColor: Colors.lightGreen.shade300,
      //             //             //   textColor: Colors.black,
      //             //             // );
      //             //           }));
      //             // },
      //           ),
      //         ),
      //         ElevatedButton(
      //           style: ElevatedButton.styleFrom(
      //             elevation: 8,
      //             padding: EdgeInsets.symmetric(horizontal: 30),
      //           ),
      //           onPressed: () {},
      //           child: Text(
      //             'Supply',
      //             style: TextStyle(
      //               fontSize: 16.sp,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget itemDetails(String attribute, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Text(
            attribute,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
