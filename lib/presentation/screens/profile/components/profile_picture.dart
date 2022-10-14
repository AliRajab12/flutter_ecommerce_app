import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getProportionateScreenHeight(150),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: const EdgeInsets.only(top:25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 25,),
                const Text("Joe Doe",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "Serif"
                ),),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on_outlined,color: Colors.black,size: 30,),
                    SizedBox(width: 10,),
                    Text(
                        "Address: 43 Oxford Road M13\n4GR Manchester, UK",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                      ),
                    ),
                  ],
                )
            ],
            ),
          ),
          // To add rounded image
          const Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 56,
              width: 56,
              child:  CircleAvatar(
                backgroundImage: AssetImage("assets/images/fashion.jpg",),
              ),
            ),
          )
        ],
      ),
    );
  }
}
