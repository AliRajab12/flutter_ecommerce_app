import 'package:flutter/material.dart';
import 'package:store/presentation/widgets/circle.dart';
import 'package:store/Utilities/size_config.dart';

import 'package:store/constants/text_style.dart';

class ProductColorList extends StatefulWidget {
  final List<Map<String,dynamic>> productColors;
  const ProductColorList({Key? key, required this.productColors}) : super(key: key);

  @override
  _ProductColorListState createState() => _ProductColorListState();
}

class _ProductColorListState extends State<ProductColorList> {
  int _selectedColor =0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.getProportionateScreenWidth(20)),
      child: Column(
        children: [
          const Align(
              alignment: Alignment.centerLeft,
              child: Text("Colors",style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w700,
              ),),
          ),
          const SizedBox(height: 8,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: [
              ...List.generate(widget.productColors.length,
                      (index) =>  productColorCard(
                      colorIndex : index,
                      productColor: widget.productColors[index]["color"],
                      colorName: widget.productColors[index]["colorName"],
                      isSelected : _selectedColor == index,
                  ))
            ],
        ),
          ),
        ],
      ),
    );
  }
  GestureDetector productColorCard({required int colorIndex ,required Color productColor,required bool isSelected,required String colorName}){
    return GestureDetector(
      onTap: (){
        setState(() {
          _selectedColor = colorIndex;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: EdgeInsets.all(SizeConfig.getProportionateScreenWidth(8)),
        height: SizeConfig.getProportionateScreenWidth(40),
        width: SizeConfig.getProportionateScreenWidth(105),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? productColor : Colors.black12),
          boxShadow: const [
            BoxShadow(
            color: Color(0x0f000000),
            blurRadius: 14,
            offset:  Offset(0, 4),
          ),],
          borderRadius: const BorderRadius.all(Radius.circular(10))
            
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Circle(
              width: SizeConfig.getProportionateScreenWidth(20),
              height: SizeConfig.getProportionateScreenHeight(20),
              color: productColor,
              borderColor: Colors.transparent,
            ),
             const SizedBox(width:8,),
              Text(colorName,style: colorTextStyle,),
          ],
        ),
      ),
    );
  }
}
