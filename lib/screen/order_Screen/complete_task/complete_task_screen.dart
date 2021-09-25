import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/order_provider.dart';
import 'package:genesis_packaging_v1/utils/constants.dart';
import 'package:genesis_packaging_v1/widget/appbar_design.dart';
import 'package:genesis_packaging_v1/widget/complete_task_widget/complete_todo_widget.dart';
import 'package:provider/provider.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({Key? key}) : super(key: key);

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
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
        await Provider.of<OrderProvider>(context, listen: false)
            .fetchAndSetNewPlaceOrder('completeTask')
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
    final provider = Provider.of<OrderProvider>(context);
    final placetodos = provider.todosCompleted;
    return Scaffold(
      backgroundColor: kCanvasColor,
      appBar: PreferredSize(
        child: AppBarDesign(
          text: 'Complete Task',
          icon: Icons.arrow_back,
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : placetodos.isEmpty
              ? const Center(
                  child: Text(
                    'Complete Task is Empty.',
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
                    return CompleteTaskTodoWidget(todo: todo);
                  },
                ),
    );
  }
}
