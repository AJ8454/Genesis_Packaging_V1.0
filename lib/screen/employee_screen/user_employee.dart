import 'package:flutter/material.dart';
import 'package:genesis_packaging_v1/provider/employee_provider.dart';
import 'package:provider/provider.dart';

class UserEmployee extends StatelessWidget {
  final String? id;
  final String name;
  //final String imageUrl;

  const UserEmployee({
    Key? key,
    required this.id,
    required this.name,
    //required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final snackbar = ScaffoldMessenger.of(context);
    return Card(
      color: Color(0xFFB3DBD8),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            fontSize: 11,
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            'assets/images/drum.png',
          ),
          backgroundColor: Colors.white,
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/EditEmployeeScreen', arguments: id);
                },
                color: Colors.brown,
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<EmployeeProvider>(context, listen: false)
                        .deleteEmployee(id!)
                        .then(
                          (_) => snackbar.showSnackBar(
                            SnackBar(
                              content: Text('Employee Deleted',
                                  textAlign: TextAlign.center),
                              backgroundColor: Colors.red[400],
                            ),
                          ),
                        );
                  } catch (error) {
                    snackbar.showSnackBar(
                      SnackBar(
                        content: Text('Deleting Failed',
                            textAlign: TextAlign.center),
                      ),
                    );
                  }
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
