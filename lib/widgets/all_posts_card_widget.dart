import 'package:flutter/material.dart';
import 'package:campus_connect/helpers/thumbs_up_down.dart';

/*
	This widget builds that card for us which is being shown
	in all the tabs of the tab navigator

	Notice that we are conditionally returning code from here, i.e.,
	we return a different card for hashtags and a different card for all 
	others (news, events, announcements etc.)
*/

// ignore: must_be_immutable
class CustomCard extends StatefulWidget {
  
	CustomCard({
    Key? key,
    required this.title, required this.body,
    required this.author, required this.date,
		required this.postType, required this.agree, 
		required this.disagree, required this.hashTagId
  }) : super(key: key);

  String title, body, author, date, postType;
	int agree, disagree, hashTagId;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
	@override
  Widget build(BuildContext context) {
		if (widget.postType != 'hashtags') {
			
			/*
				This is where we return Card for news, events and announcements. 
				Notice that it does not have any thumbs up or thumbs down icons
			*/
			
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					color: Colors.grey[100],
					
					margin: const EdgeInsets.fromLTRB(10, 0, 10, 12),
					elevation: 5,
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [
								Align(
									alignment: Alignment.topLeft,
									child: Text('Published by ${ widget.author } \n', 
										style: TextStyle(
											color: Colors.grey[600], 
											fontSize: 12
										)
									),
								),
								Text(widget.title, 
									style: TextStyle(
										color: Colors.red[800], 
										fontSize: 17,
										fontFamily: 'Ottoman'
									)
								),
								const SizedBox(height: 15),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
											const Icon(Icons.schedule,
												size: 18,
											),
											const SizedBox(width: 4.0),
											Text(widget.date,
											style: TextStyle(
												color: Colors.grey[600], 
												fontSize: 12
											),
										)
									],
								),
								const SizedBox(height: 13.0),
								InkWell(
									onTap: () => Navigator.pushNamed(context, '/singlePost', arguments: {
										'title': widget.title, 
										'date': widget.date, 
										'author': widget.author, 
										'body': widget.body
									}),
									child: Column(
										children: [
											Container(
												height: 43,
												width: MediaQuery.of(context).size.width * 0.65,
												decoration: const BoxDecoration(
													// color: Colors[0xeefdec],
													color: Color.fromRGBO(100, 170, 100, 0.125),
													borderRadius: BorderRadius.all(Radius.circular(30))
												),
												child: Center(
													child: Text('View', 
														style: TextStyle(
															color: Colors.green[800], 
															fontWeight: FontWeight.bold, 
															fontSize: 15
														),	
													),
												)
											),
										],
									),
								),
								const SizedBox(height: 10.0),
							],
						),
					),
				)),
			);
		}

		/*
			This is where we return a different card (only for hashtags tab of the navigator).
			Basically, we need some extra things in a hashtag-based card. 2 such things are 
			the thumbs up button and the thumbs down button
		*/

		else if (widget.postType == 'hashtags') {
			return Padding(
				padding: const EdgeInsets.fromLTRB(10, 10, 10, 0.0),
				child: (Card(
					color: Colors.grey[100],

					margin: const EdgeInsets.fromLTRB(10, 0, 10, 12),
					elevation: 5,
					child: Padding(
						padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.center,
							children: [ 
								Align(
									alignment: Alignment.topLeft,
									child: Text('Published by ${ widget.author } \n', 
										style: TextStyle(
											color: Colors.grey[600], 
											fontSize: 12
										)
									),
								),
								GestureDetector(
									onTap: () => Navigator.pushNamed(context, '/singlePost', arguments: {
										'title': widget.title, 
										'date': widget.date, 
										'author': widget.author, 
										'body': widget.body
									}),
									child: Center(
										child: Text(widget.title,
											style: TextStyle(
												color: Colors.red[800], 
												// fontWeight: FontWeight.bold, 
												fontFamily: 'Ottoman',
												fontSize: 17
											),	
										),
									)
								),
								const SizedBox(height: 13.0),
								Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: [
											const Icon(Icons.schedule,
												size: 18,
											),
											const SizedBox(width: 4.0),
											Text( widget.date,
											style: TextStyle(
												color: Colors.grey[600], 
												fontSize: 12
											),
										)
									],
								),
								const SizedBox(height: 10.0),
								Padding(
									padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.065, 5, MediaQuery.of(context).size.width * 0.065, 15),
										child: Container(
										height: 43,
										decoration: const BoxDecoration(
											color: Color.fromRGBO(100, 170, 100, 0.125),
											borderRadius: BorderRadius.all(Radius.circular(30))
										),


										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: [
												Row(
													children: [
														IconButton(
															
															/*
																We will wait here for what the function returns.
																That will let us know if this user has already reacted to this hashtag or not. 
																If the function returns false, it means that they have already reacted, so 
																we are sure that no changes have been made to the DB. Hence, we do not make
																any changes to our local state of the widget
															*/
															
															onPressed: ()  async {
																bool ret = await handleThumbsUpDown('up', widget.hashTagId);
																setState(() {
																	if (ret) { 
																		widget.agree++; 
																	}
																});
															}, 
															icon: Icon(Icons.thumb_up, color: Colors.teal[600])
														),
														Text('${widget.agree}'), 
													],
												),
												const SizedBox(width: 8.0),
												Row(
													children: [
														IconButton(
															
															/*
																We will wait here for what the function returns.
																That will let us know if this user has already reacted to this hashtag or not. 
																If the function returns false, it means that they have already reacted, so 
																we are sure that no changes have been made to the DB. Hence, we do not make
																any changes to our local state of the widget
															*/
															
															onPressed: () async {
																bool ret = await handleThumbsUpDown('down', widget.hashTagId);
																setState( () {
																	// fix this with a conditional stat
																	if (ret) { 
																		widget.disagree++; 
																	}
																});
															}, 
															icon: Icon(Icons.thumb_down, color: Colors.red[700])
														),
														Text('${widget.disagree}')
													],
												),
											],
										),
									)
								)
							],
						),
					),
				)),
			);
		}
		return Container(); 
		// returning this to avoid returning null from this widget
	}
}
