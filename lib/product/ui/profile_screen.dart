import 'package:fashion_wave/product/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text("My Profile"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showPicker(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    backgroundImage: image != null ? FileImage(image!) : null,
                    child: image == null
                        ? const Icon(
                      Icons.person,
                      color: Colors.grey,
                    )
                        : null,
                  ),
                ),
                const SizedBox(width: 28),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sumit Kumar'),
                    Text('ssss@gmail.com')
                  ],
                ),
              ],
            ),const SizedBox(height: 28,),
            const ListTile(
             title: Text('My Orders'),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
            ),Divider(color: Colors.grey.shade200,),
            const ListTile(
              title: Text('My Address'),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
            ),Divider(color: Colors.grey.shade200,),
            const ListTile(
              title: Text('Shipping Address'),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
            ),Divider(color: Colors.grey.shade200,),
            const ListTile(
              title: Text('Payment Method'),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
            ),Divider(color: Colors.grey.shade200,),
            const ListTile(
              title: Text('My reviews'),
              trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
            ),Divider(color: Colors.grey.shade200,),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen(),));
            },
              child: const ListTile(
                title: Text('Setting'),
                trailing: Icon(Icons.arrow_forward_ios_outlined,size: 14,),
              ),
            ),Divider(color: Colors.grey.shade200,)
          ],
        ),
      ),
    );
  }
}
