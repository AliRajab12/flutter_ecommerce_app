import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/default_button.dart';

class NoOrder extends StatelessWidget {
  const NoOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50,),
        SizedBox(
          child: Image.asset(
            "assets/images/no_order.png",
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 10,),
        const Text(
          "No history yet",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10,),
        const Opacity(
          opacity: 0.57,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              "Hit the button down below to Create an order",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: DefaultButton(
            onPressed: (){},
            backgroundColor: const Color(0xff57bfe9),
            forgroundColor: Colors.white,
            text: "Start ordering",
            width: 250,
            height: 60,
          ),
        )
      ],
    );
  }
}
