import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/place_neworder_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:genesis_packaging_v1/widget/appbar_design.dart';
import 'package:genesis_packaging_v1/widget/place_order_widgets/add_todo_dialog_widget.dart';
import 'package:genesis_packaging_v1/widget/place_order_widgets/todo_widget.dart';
import 'package:genesis_packaging_v1/widget/utils.dart';
import 'package:provider/provider.dart';

class PlaceOrderScreen extends StatefulWidget {
  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  var _isLoading = false;
  var _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _refreshPlaceOrder(context);
  }

  Future<void> _refreshPlaceOrder(context) async {
    try {
      if (_isInit) {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<PlaceNewOrderProvider>(context, listen: false)
            .fetchAndSetNewPlaceOrder()
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
    final provider = Provider.of<PlaceNewOrderProvider>(context);
    final placetodos = provider.items;
    return Scaffold(
      backgroundColor: kCanvasColor,
      appBar: PreferredSize(
        child: AppBarDesign(
          text: 'Place Order',
          icon: Icons.arrow_back,
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : placetodos.isEmpty
              ? const Center(
                  child: Text(
                    'No New Place Order.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  separatorBuilder: (context, index) => Container(height: 10),
                  itemCount: placetodos.length,
                  itemBuilder: (context, index) {
                    final todo = placetodos[index];
                    return PlaceTodoWidget(todo: todo);
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AddTodoDialogWidget(),
          barrierDismissible: false,
        ),
        child: Icon(
          Icons.add,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
