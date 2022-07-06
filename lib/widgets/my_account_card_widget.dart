import 'package:flutter/material.dart';

/*
	This widget is basically a card which is shown in the form of tiles
	on the my_account.dart screen

	Notice that we are sending in 3 parameters, 
	and according to them a new card with a separate 
	1. icon 2. card title, 3. card subtitle is returned

	The code is written here for refactoring and separation of
	concerns
*/

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.tileTile,
    required this.tileSubtitle,
		required this.icon
  }) : super(key: key);

  final String tileTile;
  final String tileSubtitle;
	final Icon icon;

  @override
  Widget build(BuildContext context) {
		return Column(
			children: [
				Card(
					elevation: 5,
					child: ListTile(
						leading: icon,
						title: Text(tileTile, 
							style: const TextStyle(
								color: Colors.black, 
								fontWeight: FontWeight.bold, 
								fontSize: 18
							)
						),
						subtitle: Padding(
							padding: const EdgeInsets.only(top: 1),
							child: Text(tileSubtitle, 
								style: TextStyle(
									color: Colors.grey[700]
								)
							),
						),
					),
				), 
				const SizedBox(height: 10)
			],
		);
	}
}
