import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/PlaceOrderScreen');
              },
              child: Text('Place New Order'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Completed Task'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Pending Orders'),
            ),
          ],
        ),
      ),
    );
  }
}
