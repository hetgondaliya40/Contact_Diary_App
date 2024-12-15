import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../controllers/contact_contorller.dart';
import '../../../controllers/theme_contorller.dart';
import '../../../routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProviderTrue = Provider.of<ThemeController>(context, listen: true);
    var themeProviderFalse =
        Provider.of<ThemeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Contact App"),
        actions: [
          IconButton(
            onPressed: () {
              themeProviderFalse.changeThemeValue();
            },
            icon: (themeProviderTrue.themeModel.isTheme)
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          ),
        ],
      ),
      body: Consumer<ContactController>(
        builder: (context, provider, child) => (provider
                    .contactModel.contactList!.isNotEmpty &&
                provider.contactModel.contactList != null)
            ? ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detailPage,
                      arguments: provider.contactModel.contactList?[index],
                    );
                  },
                  title: Text(provider.contactModel.contactList![index].name),
                  subtitle: Text(
                      "+91 ${provider.contactModel.contactList![index].phoneNumber}"),
                  trailing: GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse(
                          "tel:+91-${provider.contactModel.contactList?[index].phoneNumber}");
                      await launchUrl(url);
                    },
                    child: const Icon(
                      Icons.call,
                      color: Colors.green,
                    ),
                  ),
                ),
                itemCount: provider.contactModel.contactList?.length,
              )
            : const Center(
                child: Text("No Contact Found"),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addToContactPage);
        },
        child: const Icon(
          Icons.add_ic_call_outlined,
        ),
      ),
    );
  }
}
