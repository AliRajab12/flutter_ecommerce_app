import 'package:flutter/material.dart';
import 'package:store/Utilities/size_config.dart';
import 'package:store/constants/colors.dart';
import 'package:store/constants/text_style.dart';

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool lastItem;
  final String pageUrl;

  const DrawerMenuItem({Key? key, required this.title, required this.icon,required this.lastItem, required this.pageUrl }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(
            context,
            pageUrl,
          );
          // Navigator.pushNamed(context, pageUrl);
        },
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const SizedBox(width: 18,),
                        Icon(icon,color: Colors.white,size: 20,),
                        const SizedBox(width: 13,),
                        Text(title,style: drawerItemTextStyle,),
                      ],
                    ),
                  ),
                  if(!lastItem)
                    Container(
                      margin: EdgeInsets.only(
                          right: SizeConfig.getProportionateScreenWidth(150),
                          top:8),
                      height: 1,
                      width: SizeConfig.getProportionateScreenWidth(100),
                      color: secondaryColor,
                    )
                ]
            )
        ),
      ),
    );
  }
}
