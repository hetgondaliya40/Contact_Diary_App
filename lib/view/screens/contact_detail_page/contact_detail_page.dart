import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/view/screens/add_to_contact_page/add_to_contact_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/contact_contorller.dart';
import '../../../models/contact_model.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ContactModel contact =
        ModalRoute.of(context)?.settings.arguments as ContactModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to AddContactPage for editing
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToContactPage(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ContactController>(context, listen: false)
                  .removeContactData(contact: contact);

              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.w,
                child: Text(
                  contact.name[0],
                  style: TextStyle(
                    fontSize: 100.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                contact.name,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                contact.phoneNumber,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                contact.email,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("tel:+91-${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.green,
                      ),
                    ),
                    icon: const Icon(
                      Icons.call_outlined,
                      color: Colors.white,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () async {
                      Uri url = Uri.parse("sms:${contact.phoneNumber}");
                      await launchUrl(url);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.blue,
                      ),
                    ),
                    icon: const Icon(
                      color: Colors.white,
                      Icons.sms_outlined,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.cyan,
                      ),
                    ),
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
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
}
