import 'package:flutter/material.dart'; 
import 'package:campus_connect/db/local_db.dart'; 
import 'package:campus_connect/widgets/all_posts_card_widget.dart';

/*
	This is the file where we are sending data from the home page. 
	Notice we are returning widgets conditionally, i.e., a separate
	CustomCard (with different args) is being called for hashtag, and 
	a separate CustomCard (with some ohter args) is being called for the 
	remaining tabs

	Also, notice the postTye variable. It tells us what to read from the DB, i.e., 
	news or announcements or hashtags or events

	We have made this AllPosts widget very reusable by including the postType
	variable. For all four kinds of posts in the four tabs, this widget gets called
*/

class AllPosts extends StatelessWidget {
	const AllPosts({ 
		Key? key, 
		required this.postType,
	}) : super(key: key);
	
	final String postType;

	@override
	Widget build(BuildContext context) {
		if (postType != 'hashtags') {
			return(Scaffold(
				body: SingleChildScrollView(
					child: Padding(
						padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
						child: Wrap(
							direction: Axis.horizontal,
							children: database['campusConnect'][postType].map<Widget>( (item) => 
								CustomCard( title: item['title'], body: item['body'], author: item['author'], agree: 0, disagree: 0, date: item['date'], postType: postType, hashTagId: 0)).toList()
								/*
									though we are passing agree, disagree, and hashTagId,
									but it is not being used anywhere in this case. But, for the sake of
									consistency and for supplying all the "required" arguments
									in the CustomCard widget, we pass these params with dummy values, i.e.,
									integer 0 for agree, disagree and hashTagId is being passed in
								*/
						),
					),
				),
			));
		}
		return(Scaffold(
			body: SingleChildScrollView(
				child: Padding(
					padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
					child: Wrap(
						direction: Axis.horizontal,
						children: database['campusConnect'][postType].map<Widget>( (item) => 
							CustomCard( title: item['title'], body: item['body'], author: item['author'], date: item['date'], agree: item['agree'], disagree: item['disagree'], postType: postType, hashTagId: item['id'])).toList()
					),
				),
			),
		));
	} 
}
