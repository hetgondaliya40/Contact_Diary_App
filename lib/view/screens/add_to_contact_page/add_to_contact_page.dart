import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../controllers/contact_contorller.dart';
import '../../../controllers/stepper_controller.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class AddToContactPage extends StatelessWidget {
  const AddToContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: const Text(
          'Add Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Name",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                ),
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.grey[00],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 16.w,
                ),
              ),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Email Address",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.grey[00],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 16.w,
                ),
              ),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            TextField(
              maxLength: 10,
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Phone Number",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.grey[00],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(27),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 16.w,
                ),
              ),
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String email = emailController.text;
                  String phone = phoneController.text;

                  context.read<ContactController>().addContactData(
                        name: name,
                        email: email,
                        phone: phone,
                      );

                  log("Contact Data : ${context.read<ContactController>().contactModel.contactList}");
                  Navigator.pop(context);

                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();

                  context.read<ContactController>().contactModel.image = null;
                  context.read<StepperController>().stepperModel.stepperIndex =
                      0;
                },
                child: const Text("Add Contact"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
