import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback? onPressed;
  const ProfileMenu(
      {Key? key, required this.text, required this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white),
        onPressed: onPressed,
        child: Row(
          children: [
            Expanded(
                child: Text(text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "SF Pro Text",
                      fontWeight: FontWeight.w600,
                    ))),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
