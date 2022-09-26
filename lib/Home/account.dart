import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SettingsUi(),
    );
  }
}

class SettingsUi extends StatefulWidget {
  const SettingsUi({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsUiState();
}

class _SettingsUiState extends State<SettingsUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 104, 75, 182),
          elevation: 0,
          centerTitle: true,
          title: const Text('S E T T I N G S'),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 152, 129),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 104, 75, 182),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Account",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const Divider(height: 20, thickness: 1),
                const SizedBox(
                  height: 10,
                ),
                buildAccountOption(context, "Edit Profile"),
                buildAccountOption(context, "Privacy"),
                buildAccountOption(context, "Email Addresses"),
                buildAccountOption(context, "Your Addresses"),
                buildAccountOption(context, "Change Timezone"),
                buildAccountOption(context, "Manage Notification"),
                buildAccountOption(context, "TERMINATE ACCOUNT")
              ],
            )));
  }
}

GestureDetector buildAccountOption(BuildContext context, String title) {
  return GestureDetector(
    onTap: () => {},
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          const Icon(Icons.arrow_forward_ios, color: Colors.black)
        ],
      ),
    ),
  );
}
