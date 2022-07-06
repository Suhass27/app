import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/*
	This is where we display logo and "loading bar". 
	This gets loaded initially, and then gets replaced by
	sign in screen

	We are "wasting" user's 3 seconds here, i.e., we make the process of
	loading span over 3 seconds just for showing some logo and letting them
	have an impression that we are "doing something behind the scenes"

	Also, in case we get a Firebase connection, we will do initial Firebase 
	loading asyncronously, and now the splash screen will stay up for as long
	as we are getting data from the DB (not for 3 seconds)
*/

class Splash extends StatelessWidget {
	const Splash({ Key? key }) : super(key: key);

	void nextScreen(context) {
		Future.delayed(const Duration(seconds: 3), () => {
			Navigator.pushReplacementNamed(context, '/signin')
		});
	}

	@override
	Widget build(BuildContext context) {
		nextScreen(context);
		
		return Scaffold(
			body: Padding(
							padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
							child: Column(
									// mainAxisAlignment: MainAxisAlignment.center,
									children: [
										CircleAvatar(
											backgroundImage: const AssetImage('assets/images/cc-3.png'),
											radius: MediaQuery.of(context).size.width * 0.45,
											backgroundColor: Colors.transparent,
										),
										
										/*
											Install spinkkit package and then use it.
											The wavy structure you see under the Campus Connect logo
											is SpinKitWave basically
										*/
										
										const SizedBox(height: 50),
										SpinKitWave(
											color: Colors.teal[700],
											size: 30.0
										)
									]
								),
						),
			//)
		);
	}
}
