class Employee {
  final String uid;
  final String name;
  final String email;
  final String empId;
  final String phone;
  final String joiningDate;
  final String department;

  Employee({
    required this.uid,
    required this.name,
    required this.email,
    required this.empId,
    required this.phone,
    required this.joiningDate,
    required this.department,
  });

  factory Employee.fromFirestore(String uid, Map<String, dynamic> data) {
    return Employee(
      uid: uid,
      name: data['name'] ?? data['nmae'] ?? '',
      email: data['email'] ?? data['email id'] ?? '',
      empId: data['empId'] ?? data['employee id'] ?? '',
      phone: data['phone'] ?? data['phone number'] ?? '',
      joiningDate: data['joiningDate'] ?? data['joining date'] ?? '',
      department: data['department'] ?? '',
    );
  }
}
