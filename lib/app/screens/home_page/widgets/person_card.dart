import 'package:flutter/material.dart';

class PersonCard extends StatelessWidget {
  const PersonCard(
      {super.key,
      required this.email,
      required this.name,
      required this.phone,
      required this.phoneExt,
      this.onPressedSeePosts});

  final String name;
  final String email;
  final String phone;
  final String phoneExt;
  final void Function()? onPressedSeePosts;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              name,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              email,
              style: const TextStyle(fontSize: 15.0),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Center(
                child: Text(
                  name[0].toUpperCase(),
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 15.0, top: 10.0, bottom: 10.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 7.0,
                        ),
                        Text(phone),
                      ],
                    ),
                    Text("ext. $phoneExt")
                  ],
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.brown),
                      overlayColor: MaterialStateProperty.all<Color>(
                          Colors.brown.shade300),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      elevation: MaterialStateProperty.all<double>(3),
                    ),
                    onPressed: onPressedSeePosts,
                    child: const Row(
                      children: [
                        Text(
                          "Ver publicaciones",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
