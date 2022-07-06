import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

/*
	One of the most simple and easy-to-understand screens. 
	Just read the code, and you will know what is happening. 

	Alongside reading the code, do take a peek at the screen itself, 
	which will let you know better. The screen can be accessed from the drawer
*/

class About extends StatelessWidget {
	const About({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			body: SingleChildScrollView(
				child: SafeArea(
					child: Stack(
						children: [
							IconButton(
								icon: const Icon(Icons.arrow_back_ios),
								onPressed: () => Navigator.pop(context),
							),
							Padding(
								padding: const EdgeInsets.fromLTRB(15, 40, 15, 20),
								child: Center(
									child: Column(
										children: [
											CircleAvatar(
												radius: MediaQuery.of(context).size.width * 0.35,
												backgroundImage: const AssetImage('assets/images/me-2.jpg'),
												backgroundColor: Colors.transparent,
											),
											const SizedBox(height: 30),
											Card(
												shape: RoundedRectangleBorder(
													borderRadius: BorderRadius.circular(9)
												),
												elevation: 5.0,
												child: Padding(
													padding: const EdgeInsets.fromLTRB(30, 20, 30, 12),
													child: Column(
														children: [
															Text('Our Developer\'s Story', 
																style: TextStyle(
																	fontSize: 23, 
																	color: Colors.teal[700], 
																	fontFamily: 'Ottoman'
																)
															),
															const SizedBox(height: 20),
															const Text('Uzair Afzal (2022-10-0031) hit upon the idea of decreasing communication barriers across the campus of LUMS. So, in his Summer break, 2021, he created Campus Connect from the ground up as a rising final-year student at LUMS \n\nThe application has been programmed in Dart programming language and Flutter UI toolkit. Uziar knew neither of the afore-mentioned technologies, but this did not stop him. At first, he learnt the language, and then he learnt the framework itself. Finally he embarked on the journey of creating this app\n', 
																style: TextStyle(
																	fontSize: 19,
																	fontFamily: 'Cormorant-Light'
																)
															)
														],
													),
												), 
											),
											const SizedBox(height: 15.0),
											Card(
												shape: RoundedRectangleBorder(
    											borderRadius: BorderRadius.circular(9),
  											),
												elevation: 5.0,
												child: Padding(
													padding: const EdgeInsets.fromLTRB(30, 30, 30, 25),
													child: Column(
														children: [
															Text('About Uzair Afzal', 
																style: TextStyle(
																	fontSize: 25, 
																	color: Colors.teal[700], 
																	fontFamily: 'Ottoman'
																)
															),
															const SizedBox(height: 20),
															const Text('At the time of writing (July, 2021), Uzair is a final-year computer science and software engineering student at Lahore University of Management Sciences (LUMS) \n\nHe describes himself as a technology-business enthusiast, as he is very much intrigued by computer hardware, the semiconductor industry, finance of investments, economics, and technology entrepreneurship. Recently, he found his interest in moral philosophy and psychology \n\nUzair has been engineering software for the web (LAMPP & MERN stacks), mobile (iOS & Android) and blockchain (Ethereum) since 2019, and he is quite passionate about it as well \n\nGet in touch with him, or follow him on the following social platforms',
																style: TextStyle(
																	fontSize: 20,
																	fontFamily: 'Cormorant-Light'
																)
															),
															const SizedBox(height: 20),
															Row(
																mainAxisAlignment: MainAxisAlignment.center,
																children: [
																	Stack(
																		children: [
																			Positioned(
																				child: Row(
																					children: [
																						RawMaterialButton(
																							elevation: 7.0,
																							onPressed: () => html.window.open('https://www.facebook.com/profile.php?id=100006982786800', 'Uzair\'s Facebook Account'), // url and title (two inputs)
																							fillColor: const Color(0xFFF5F6F9),
																							child: const Icon(Icons.facebook, size: 35,),
																							padding: const EdgeInsets.all(7.0),
																							shape: const CircleBorder(),
																						),
																						RawMaterialButton(
																							elevation: 7.0,
																							onPressed: () => html.window.open('https://www.quora.com/profile/Uzair-Afzal-6', 'Uzair\'s Quora Account'),
																							fillColor: Colors.transparent,
																							child: Text('Q', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal[600], fontSize: 30)),
																							padding: const EdgeInsets.all(7.0),
																							shape: const CircleBorder(),
																						),
																						RawMaterialButton(
																							elevation: 7.0,
																							onPressed: () => html.window.open('http://www.uzair-reviews.com', 'Uzair\'s Personal Website'),
																							fillColor: Colors.transparent,
																							child: const Icon(Icons.public_rounded, size: 35),
																							padding: const EdgeInsets.all(7.0),
																							shape: const CircleBorder(),
																						),
																					],
																				)
																			),
																		],
																	)
																],
															)
														],
													),
												)
											),
										],
									),
								),
							)
						],
					)
				)
			)
		));
	}
}
