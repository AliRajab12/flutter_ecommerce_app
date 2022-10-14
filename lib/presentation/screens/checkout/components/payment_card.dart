import 'package:flutter/material.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/enums.dart';

class PaymentCard extends StatefulWidget {
  const PaymentCard({Key? key}) : super(key: key);

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
   PaymentMethod _paymentMethod = PaymentMethod.visa;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Payment Method",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25)
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10,right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25,),
                const SizedBox(width: 10,),
                buildRadioButton(PaymentMethod.visa,"assets/images/visa.png","**** **** **** 1234"),
                const SizedBox(height: 25,),
                buildRadioButton(PaymentMethod.master,"assets/images/master.png","**** **** **** 1234"),
                const SizedBox(height: 25,),
                buildRadioButton(PaymentMethod.bank,"assets/images/bank.png","**** **** **** 1234"),
                const SizedBox(height: 25,),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget buildRadioButton(PaymentMethod value, String imagePath, String text){
    return Row(
        children: [
          Radio(
            activeColor: primaryColor,
            groupValue: _paymentMethod,
            onChanged: (PaymentMethod? value){
              setState(() {
                _paymentMethod = value!;
              });
            },
            value: value,
          ),
          Image.asset(
            imagePath,
          ),
          const SizedBox(width: 10,),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal
            ),
          ),
        ]);
  }
}
