import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShippingCard extends StatelessWidget {
  const ShippingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Shipping information",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
                onPressed: (){},
                child: const Text("change",style: TextStyle(
                  color: Color(0xff5956e9),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),))
          ],
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
                Row(
                  children: const [
                     SizedBox(width: 18,),
                     Icon(FontAwesomeIcons.user,color: Colors.black,size: 20,),
                     SizedBox(width: 13,),
                     Text("Joe Doe",style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                         fontFamily: "Serif"
                    ),),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 12,),
                    Icon(Icons.location_on_outlined,color: Colors.black,size: 30,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Text("Airport Road Damascus, Syria",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontFamily: "Serif",
                      ),),
                    ),
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: const [
                    SizedBox(width: 12,),
                    Icon(Icons.phone_in_talk_outlined,color: Colors.black,size: 30,),
                    SizedBox(width: 10,),
                    Text("+963 123456789",style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Serif",
                      fontSize: 15,
                    ),),
                  ],
                ),
                const SizedBox(height: 25,),
              ],
            ),
          ),
        )
      ],
    );
  }
}
