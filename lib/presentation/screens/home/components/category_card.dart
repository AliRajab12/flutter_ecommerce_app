import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store/Utilities/size_config.dart';

class CategoryCard extends StatelessWidget {

  final String iconPath, description;
  final GestureTapCallback onTap;

  const CategoryCard({Key? key,required this.iconPath,required this.description,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
      // SizedBox that contains category image and description
        child: SizedBox(
          width: SizeConfig.getProportionateScreenWidth(55),
          child: Column(
            children: [
              // Container that contains category's image
              Container(
                padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(15)),
                height: SizeConfig.getProportionateScreenWidth(55),
                width: SizeConfig.getProportionateScreenWidth(55),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                child: SvgPicture.asset(iconPath),
              ),
              const SizedBox(height: 5,),
              // category's description
              Text(description,textAlign: TextAlign.center,)
            ],
          ),
        ),
    );
  }
}
