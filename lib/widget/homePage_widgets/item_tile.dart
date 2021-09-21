import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/models/product_model.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ItemTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed('/ProductDetailScreen', arguments: product.id),
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: Key(product.id!),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.fill,
                      width: 18.h,
                      height: 18.h,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                product.title!,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '${product.type!}',
                style: TextStyle(
                  color: kGreyColor,
                  fontSize: 14.sp,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\u20B9 ${product.rate!}',
                style: TextStyle(
                  color: Color(0xFFD4B078),
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
