import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store/presentation/widgets/no_internet_connection.dart';
import 'package:store/Utilities/size_config.dart';
import 'components/custom_drawer.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  late bool isDeviceConnected = true;

  @override
  void initState(){
    checkConnectivity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  Scaffold(
          body:  SafeArea(
            child: (isDeviceConnected) ? Stack(
              children: const [
                 CustomDrawer(),
                 HomeContent(),
              ]
            ): const NoInternet()
          ),

    );
  }


  Future<void> checkConnectivity() async{
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      setState(() {
        isDeviceConnected = isDeviceConnected;
      });
    });
  }
  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}