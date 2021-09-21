import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/employee_provider.dart';
import 'package:genesis_packaging_v1/screen/employee_screen/user_employee.dart';
import 'package:genesis_packaging_v1/widget/appbar_design.dart';
import 'package:provider/provider.dart';

class EmployeeUserScreen extends StatelessWidget {
  Future<void> _refreshEmployee(BuildContext context) async {
    try {
      await Provider.of<EmployeeProvider>(context, listen: false)
          .fetchAndSetEmployee();
    } catch (error) {
      // Fluttertoast.showToast(
      //   msg: 'No Employees Added Yet',
      //   fontSize: 15.sp,
      //   backgroundColor: HexColor('#E2E0DF'),
      //   textColor: Theme.of(context).errorColor,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarDesign(
          icon: Icons.arrow_back,
          text: 'All Employee',
        ),
        preferredSize: Size.fromHeight(100),
      ),
      body: FutureBuilder(
        future: _refreshEmployee(context),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<EmployeeProvider>(
                    builder: (ctx, employeeData, _) => Padding(
                      padding: EdgeInsets.all(8),
                      child: ListView.builder(
                        itemCount: employeeData.worker.length,
                        itemBuilder: (_, i) => Column(
                          children: [
                            UserEmployee(
                              id: employeeData.worker[i].id!,
                              name: employeeData.worker[i].name!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/EditEmployeeScreen');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
