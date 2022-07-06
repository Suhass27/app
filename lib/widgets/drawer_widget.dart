import 'package:flutter/material.dart'; 
import 'package:flutter/cupertino.dart';
import 'package:campus_connect/helpers/alert_popup.dart';

/*
	This is the drawer of our application. The drawer is shown
	on the home page and in all the tabs in the tab navigator. 

	This doesn't really require any explanation. Just read code
	and take a look at the drawer itself, and you will have no difficulty
	understanding what is gowing on

	One small reminder: the drawer is being imported and setup in the home
	widget ( Home() in home.dart). The source code is written in this file
	for separation of concerns and refactoring purposes
*/

class CustomDrawer extends StatelessWidget {
	const CustomDrawer({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Drawer(
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.stretch,
				children: [
					const SizedBox(
						height: 300,
						child: DrawerHeader(
							decoration: BoxDecoration(
								color: Color.fromRGBO(100, 180, 100, 0.25),
							),
							child: CircleAvatar(
								backgroundImage: AssetImage('assets/images/cc-3.png'),
								backgroundColor: Colors.transparent,
							),
						),
					),
					Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 0, 10),
						child: InkWell(
							onTap: () => Navigator.pushNamed(context, '/account'),
							child: Row(
								children: const [
									Icon(
										Icons.manage_accounts_outlined
									),
									SizedBox(width: 7),
									Text('My Account'),
								],
							),
						),
					),
					Padding(
						padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
						child: InkWell(
							onTap: () => Navigator.pushNamed(context, '/about'),
							child: Row(
								children: const [
									Icon(
										Icons.people_outline
									),
									SizedBox(width: 7),
									Text('About Us'),
								],
							),
						),
					),
					const Spacer(),
					Divider(
						color: Colors.grey[700]
					),
					Padding(
						padding: const EdgeInsets.fromLTRB(20, 10, 0, 15),
						child: InkWell(
							onTap: () => alertPopUp(
								'Sign Out?', 
								'Are you sure you want to sign out of Campus Connect? Be notified that doing so will make you lose all your work in progress (if any)', 
								context
							),
							child: Row(
								children: const [
									Icon(
										Icons.lock_outline
									),
									SizedBox(width: 7),
									Text('Sign Out'),
								],
							),
						),
					)
				]
			),
		);
	}
}
