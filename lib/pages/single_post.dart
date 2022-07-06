import 'package:flutter/material.dart'; 

/*
	This screens handles what you see when
	you click on any news or event and you go to the next
	screen to see the details of it

	We pass title, author, date and body of the card here. 
	All that is then shown here to the users

	Also, we have created a back button that allows us to pop this screen
	without using a top app bar. When you don't use a top app bar, you have to 
	wrap things in a SafeArea( ... ) widget, so that nothing goes up and up
	the screen and things appear decent and gets pulled down a little from the top
*/

class SinglePost extends StatelessWidget {
	const SinglePost({ Key? key }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		
		var args = ModalRoute.of(context)!.settings.arguments as Map;
		// type casting them to Map from object so that we can [] to access nested elements
		
		return Scaffold(
			body: SingleChildScrollView( // lets us scroll without losing data
				child: SafeArea(
					child: Stack(
						children: [
							IconButton(
								icon: const Icon(Icons.arrow_back_ios),
								onPressed: () => Navigator.pop(context),
							),
							Padding(
								padding: const EdgeInsets.fromLTRB(10, 60, 10, 0.0), // for relative padding according to screen size (not absolute padding)
								child: Center(
									child: Column(
										children: [
											Text(args['title'], 
												style: TextStyle(
													color: Colors.red[800], 
													// fontWeight: FontWeight.bold,
													fontFamily: 'Ottoman',
													fontSize: 20
												)
											),
											const SizedBox(height: 15.0),
											Card(
												elevation: 5.0,
												child: Padding(
													padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
													child: SelectableText('${args['body']} \n', 
														style: const TextStyle(
															fontSize: 20, 
															fontFamily: 'Cormorant-Light'
															// fontWeight: FontWeight.bold
														)
													),
												)
											),
											const SizedBox(height: 10,),
											Align(
												alignment: Alignment.center,
												child: Text('Published by ${ args['author']} on ${ args['date'] }', 
													style: TextStyle(
														color: Colors.grey[700], 
														fontStyle: FontStyle.italic, 
														
													),
												),
											),
											const SizedBox(height: 8.0),
										]
									),
								),
							)
						],
					),
				),
			)
		);
	}
}
