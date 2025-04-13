# dashbordwebapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Attendance Management System

This is a Flutter-based **Attendance Management System** designed for managing employee attendance records. The system includes features like viewing today's dashboard, managing employees, creating new employees, and viewing monthly attendance for individual employees.

---

## **Features**
- **Today Dashboard**: Displays the attendance summary for the current day, including present and absent employees.
- **Employee Management**: View a list of employees and their details.
- **Create Employee**: Add new employees to the system.
- **Monthly Attendance**: View detailed attendance records for a specific employee.

---

## **Folder Structure**
The project is organized as follows:


## **folder structure**

lib/
├── main.dart                  ← App start
├── firebase_options.dart      ← Firebase config
├── Model/                     ← Data models
│   ├── AttendanceRecord.dart
│   ├── Employee.dart
├── utils/                     ← Styles and utilities
│   └── AppTheme.dart
├── view/                      ← UI components and screens
│   ├── DetaolsOfEmployee.dart
│   ├── Screens/
│   │   ├── Creat_Employee_screen.dart
│   │   ├── Employeesscreen.dart
│   │   ├── Emplyee_monthly_Screen.dart
│   │   ├── Homescreen.dart
│   │   └── Today_dashbord_Screen.dart
│   └── widgets/
│       └── dashbordselectingbutton.dart
├── viewmode/                  ← App logic and state management
│   ├── provider/
│   │   ├── AttendanceProvider.dart
│   │   ├── Creat_employee_provider.dart
│   │   ├── EmployeeAttendanceProvider.dart
│   │   ├── EmployeesProvider.dart
│   │   └── Home_pagea_provider.dart
│   └── Services/
│       └── FirestoreServices.dart

# Firestore Structure

users
└── {user_id}
    ├── name         : string
    ├── email        : string
    ├── emp_id       : string
    ├── phone        : string
    ├── joining_date : Timestamp
    └── department   : string

attendance
└── {YYYY-MM-DD}
    └── records
        └── {user_id}
            ├── present   : boolean
            └── timestamp : Timestamp

### **How to Use**
- Replace `<repository-url>` with your repository URL.
- Add your Firebase configuration details in the `Set Up Firebase` section.
- Replace placeholder contact information with your actual details.

Let me know if you need further assistance!