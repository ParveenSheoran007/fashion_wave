import 'package:fashion_wave/auth/ui/login_screen.dart';
import 'package:fashion_wave/product/ui/cart_screen.dart';
import 'package:fashion_wave/product/ui/favourate_screen.dart';
import 'package:fashion_wave/product/ui/payment_method_screen.dart';
import 'package:fashion_wave/product/ui/setting_screen.dart';
import 'package:fashion_wave/product/ui/widget/Addres_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  File? image;
  final String imagePathKey = 'profileImagePath';

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString(imagePathKey);
    if (imagePath != null) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  Future<void> saveImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(imagePathKey, path);
  }

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      saveImage(pickedFile.path);
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

  void showRatingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Rate Us',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Select Language',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              buildLanguageOption(Icons.language, 'English'),
              buildLanguageOption(Icons.language, 'Hindi'),
              buildLanguageOption(Icons.language, 'Spanish'),
              buildLanguageOption(Icons.language, 'Punjabi'),
              buildLanguageOption(Icons.language, 'Marathi'),
            ],
          ),
        );
      },
    );
  }

  Widget buildLanguageOption(IconData icon, String language) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(language),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text("My Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(),
                      ));
                },
                child: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                    children: [Text('Sumit Kumar')],
                  ),
                ],
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.red),
                          SizedBox(height: 6),
                          Text('Help Centre'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showLanguageBottomSheet(context);
                      },
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.language, color: Colors.blue),
                            SizedBox(height: 6),
                            Text('Change language'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavourateScreen(),
                      ));
                },
                child: const ListTile(
                  title: Text('WishListed Products'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressScreen(),
                      ));
                },
                child: const ListTile(
                  title: Text('My Address'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaymentMethodScreen(),
                      ));
                },
                child: const ListTile(
                  title: Text('Payment Method'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              ListTile(
                title: const Text('My reviews'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 14,
                ),
                onTap: () {
                  showRatingBottomSheet(context);
                },
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingScreen(),
                      ));
                },
                child: const ListTile(
                  title: Text('Setting'),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                  ),
                ),
              ),
              Divider(
                color: Colors.grey.shade200,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Cancel')),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LogInScreen(),
                                      ));
                                },
                                child: const Text('Sure')),
                          ],
                        );
                      });
                },
                child: const ListTile(
                  title: Text('LogOut'),
                  trailing: Icon(
                    (Icons.login_outlined),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
