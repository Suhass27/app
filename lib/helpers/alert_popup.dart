import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // iOS library that Flutter uses
import 'package:campus_connect/db/sessions.dart';

/*
	This is a reusable alert pop up. 
	It is being used before signing out an active user.
	Its usage can be extended. Notice the incoming title and 
	msg params. They let us reuse this function
*/

void alertPopUp(String title, String msg, BuildContext context) {
	showDialog(
		context: context,
		builder: (BuildContext context) => CupertinoAlertDialog(
			title: Text(title),
			content: Text(msg),
			actions: [
				CupertinoDialogAction(
					child: const Text('Yes'),
					onPressed: () {
						activeUser['campusID'] = activeUser['firstName'] = activeUser['lastName'] = null;
						Navigator.pushReplacementNamed(context, '/signin');
						
					},
				), 
				CupertinoDialogAction(
					child: Text('Cancel', 
						style: TextStyle(color: Colors.red[900]),
					), 
					onPressed: () => Navigator.pop(context),
				)
			],
		),
	);
}
