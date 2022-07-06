import 'package:flutter/material.dart'; 
import 'package:campus_connect/pages/home.dart';
import 'package:campus_connect/pages/signin.dart';
import 'package:campus_connect/pages/my_account.dart';
import 'package:campus_connect/pages/about_us.dart';
import 'package:campus_connect/pages/splash.dart';
import 'package:campus_connect/pages/single_post.dart';
import 'package:campus_connect/pages/new_post.dart';

void main() => runApp(MaterialApp( 
	// initialRoute: '/home',
	routes: {
		'/': (context) => const Splash(), 
		'/signin': (context) => const SignIn(), 
		'/home': (context) => const Home(),
		'/account': (context) => const Account(),
		'/about': (context) => const About(),
		'/singlePost': (context) => const SinglePost(),
		'/newPost': (context) => const NewPost(),
	},

	/*
		Splash screen is shown at first, which is replaced with the sign in screen in 3 seconds.
		The latter is also replaced (after successful signing in) with the home screen

		After entering home, screens are always pushed and popped, not replaced.
		Only in case of adding a new post (news, events, announcements, hashtags)
		we push replacement (even after entering home). 
		In all other cases, after entering home, we only push and pop screens and contexts
	*/

	theme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal[800],
    accentColor: Colors.red[800],

		iconTheme: IconThemeData(
			color: Colors.teal[600]
		),

		errorColor: Colors.red[600]
  )
));
