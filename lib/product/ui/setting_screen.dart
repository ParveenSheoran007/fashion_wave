import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  bool salesNotification = false;
  bool newArrivalNotification = false;
  bool deliveryStatusNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text('Setting'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                      showPasswordChangeBottomSheet(context);
                    },
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Card(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: TextFormField(
                    onTap: () {
                      showPasswordChangeBottomSheet(context);
                    },
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.black26),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Notifications',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('Sales'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: salesNotification,
                      onChanged: (value) {
                        setState(() {
                          salesNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('New Arrival'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: newArrivalNotification,
                      onChanged: (value) {
                        setState(() {
                          newArrivalNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  const Expanded(
                    child: Text('Delivery Status Changes'),
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: deliveryStatusNotification,
                      onChanged: (value) {
                        setState(() {
                          deliveryStatusNotification = value;
                        });
                      },
                      activeColor: Colors.red,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPasswordChangeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Password Change',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        onTap: () {
                          showPasswordChangeBottomSheet(context);
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        onTap: () {
                          showPasswordChangeBottomSheet(context);
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Card(
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white70),
                      child: TextFormField(
                        onTap: () {
                          showPasswordChangeBottomSheet(context);
                        },
                        cursorColor: Colors.black,
                        decoration: const InputDecoration(
                          hintText: 'Old Password',
                          hintStyle: TextStyle(color: Colors.black26),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 46,
                    width: double.infinity,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        'Save Password',
                        style: TextStyle(color: Colors.white,fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
