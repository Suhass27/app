import 'package:flutter/material.dart';
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/db/sessions.dart';
import 'dart:math';

class NewPost extends StatelessWidget {
	const NewPost({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		
		Map args = ModalRoute.of(context)!.settings.arguments as Map; // the information of the type of post (out of 4 possibities) comes here
		String date = DateTime.now().toString();
		String? signedInPerson = activeUser['campusID'];
		signedInPerson ??= 'default';
		final formKey = GlobalKey<FormState>();
		
		/*
			Now, this is important. Take a look at the newData
			Map down below. We are storing 
			1. reactedBy[] array
			2. id 
			3. agree
			4. disagree
			fields down below. Though we need these fields only in case of a hashtag, 
			but still we keep them in all other as well (news, events, announcements)
			to avoid errors like: 

			Error Message: "Map<String, String> expected but got Map<String, Object>"
			or the other way around

			So, the bottom line is, do not change the newData Map
		*/
		
		Map<String, Object> newData = {
			'id': Random().nextInt(1000000000) + 0,
			'title': '',
			'body': '',
			'author': '${ database['campusConnect']['enrolledStudents'][signedInPerson]['firstName']} ${ database['campusConnect']['enrolledStudents'][signedInPerson]['lastName'] }', 
			'date': date.substring(0, date.indexOf(' ')),
			'agree': 0,
			'disagree': 0,
			'reactedBy': []
		};

		String dbFieldToUpdate = 
		args['postType'] == 'News' ? 'news' : 
		args['postType'] == 'Events' ? 'events' :
		args['postType'] == 'Announcements' ? 'announcements' :
		args['postType'] == '#HashTags' ? 'hashtags' : '';
		
		return (Scaffold(
			body: SafeArea(
				child: SingleChildScrollView(
					child: Stack(
						children: [
							IconButton(
								onPressed: () => Navigator.pop(context), 
								icon: const Icon(Icons.arrow_back_ios)
							),
							const SizedBox(height: 20),
							Padding(
								padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
								child: Center(
									child: Column(
										children: [
											Padding(
												padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.065, 5, MediaQuery.of(context).size.width * 0.065, 15),
												child: Container(
													height: 50,
													decoration: const BoxDecoration(
														color: Color.fromRGBO(100, 170, 100, 0.125),
														borderRadius: BorderRadius.all(Radius.circular(10))
													),
													child: Center(
														child: Text('Add New ${ args['postType'] } Here', 
															style: TextStyle(
																color: Colors.green[800],
																fontSize: 18, 
																fontFamily: 'Ottoman'
															),	
														),
													)
												),
											),
											Form(
												key: formKey,
												child: Column(
													children: [
														TextFormField(
															decoration: const InputDecoration(
																hintText: 'Add Title', 
																border: OutlineInputBorder()
															),
															
															/*
																This validator ( and the one down below ) gets called
																when you press the "tick" floating action button to submit
																the new post
															*/
															
															validator: (String? value) {
																if (value == null || value.isEmpty ) {
																	return('You Must Add a Title for This ${ args['postType'] }');
																}
																newData['title'] = value;
															},
														),
														const SizedBox(height: 15.0),
														TextFormField(
															keyboardType: TextInputType.multiline,
															maxLines: 15,
															decoration: const InputDecoration(
																hintText: 'Add Details', 
																border: OutlineInputBorder()
															),
															validator: (String? value) {
																if (value == null || value.isEmpty ) {
																	return('You Must Add Details for This ${ args['postType'] }');
																}
																newData['body'] = value;
															},
														), 
														const SizedBox(height: 10),
														Align(
															alignment: Alignment.bottomRight,
															child: Text('Published by ${ newData['author'] } on ${ newData['date'] }', 
																style: TextStyle(
																	color: Colors.grey[700], 
																	fontStyle: FontStyle.italic
																)
															),
														),
													],
												)
											)
										]
									),
								),
							),
						],
					),
				)
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					if (formKey.currentState!.validate() && signedInPerson != 'default') {
						database['campusConnect'][dbFieldToUpdate].insert(0, newData); // insert at start
						Navigator.pushReplacementNamed(context, '/home');

						// notice that without signing in (default user) cannot add new posts
					}
				},
				child: const Icon(
					Icons.done,
					size: 36,
				)
			),
		));
	}
}
