import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/viewmode/provider/Creat_employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatEmployeeScreen extends StatefulWidget {
  CreatEmployeeScreen({super.key});

  @override
  State<CreatEmployeeScreen> createState() => _CreatEmployeeScreenState();
}

class _CreatEmployeeScreenState extends State<CreatEmployeeScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _departmentController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final employeecreatProvider = Provider.of<CreateEmployeeProvider>(context);
    return employeecreatProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Employee',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Employee Information',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone No',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _departmentController,
                          decoration: InputDecoration(
                            labelText: 'Department',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {
                                _nameController.clear();
                                _emailController.clear();
                                _phoneController.clear();
                                _departmentController.clear();
                                _passwordController.clear();
                              },
                              child: Text('Cancel'),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 1,
                                    132, 239), // Set button color to blue
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              onPressed: () {
                                print(
                                    'Employee creation initiated@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                                employeecreatProvider.createEmployee(
                                    name: _nameController.text.trim(),
                                    emailid: _emailController.text.trim(),
                                    phonenumber: _phoneController.text.trim(),
                                    department:
                                        _departmentController.text.trim(),
                                    password: _passwordController.text.trim());
                              },
                              child: employeecreatProvider.isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      employeecreatProvider.isEmployeeCreated
                                          ? 'done'
                                          : 'Submit',
                                      style: AppTheme.labelStyle
                                          .copyWith(color: Colors.white),
                                    ),
                            ),
                          ],
                        ),
                      ]),
                )
              ],
            ),
          );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _departmentController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
