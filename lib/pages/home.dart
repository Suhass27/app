import 'package:flutter/material.dart'; 
import 'package:campus_connect/widgets/drawer_widget.dart';
import 'package:campus_connect/pages/all_posts.dart';

class Home extends StatefulWidget {
	const Home({ Key? key }) : super(key: key);

	@override
	_HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
	
	/*
		Notice the currentTab and tabName variables.
		There are the initial values of our stateful
		widget, i.e., when the app loads, we are on 0th tab
		which is called News
	*/
	
	int currentTab = 0;
	String tabName = 'News';

	/*
		Notice the WidgetList down below. This list
		is making our AllPost widget and Home widget
		reusable
		
		We change the params according to what we
		want to read from the DB, but we are using the same widget, 
		i.e., widgetList

		Go down to the body section in this widget. Over there, we 
		are calling one of these widgets from this array based on what tab
		the user clicks in the bottom tab navigator
	*/
  
	final List <Widget> widgetList = 
	[
		const AllPosts(postType: 'news'),
		const AllPosts(postType: 'events'),
		const AllPosts(postType: 'announcements'),
		const AllPosts(postType: 'hashtags')
	];

	final List<String> allTabNames = ['News', 'Events', 'Announcements', '#HashTags'];

	void onTabTapped(int index) {
		
		/*
			The setState() method triggers build() all over again. 
			When the user presses on any new tab in the bottom tab
			navigator, this method gets called. This method causes build() 
			to be run again, which causes a new widget to be called from the array
			(widgetList)
		*/
		
		setState(() {
			currentTab = index;
			tabName = allTabNames[currentTab];
		});
 	}
	
	@override
	Widget build(BuildContext context) {
		return(Scaffold(
			appBar: PreferredSize(
				preferredSize: const Size.fromHeight(75.0),
				child: AppBar(
						title: Container(
						margin: const EdgeInsets.only(top: 20),
						child: Text(tabName, 
							style: const TextStyle(
								fontSize: 22,
							)
						), 
					),
					centerTitle: true,
					elevation: 0,
				),
			),
			bottomNavigationBar: BottomNavigationBar(
				
				type: BottomNavigationBarType.fixed,
				currentIndex: currentTab, // tells tab navigator which tab to show (from 0th to 3rd)
				onTap: onTabTapped, // automatically passes the index to the function. Index is the tab number we want to switch to
				selectedItemColor: Colors.red[800],
				unselectedItemColor: Colors.teal[600],
				items: const [
					BottomNavigationBarItem(
						icon: Icon(Icons.feed_outlined),
						label: 'News'
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.celebration_outlined),
						label: 'Events'
					), 
					BottomNavigationBarItem(
						icon: Icon(Icons.campaign_outlined), 
						label: 'Announcements'
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.tag_outlined),
						label: 'HashTags'
					),
				],
			),
			drawer: const CustomDrawer(), 
			// including our drawer here. See drawer_widget.dart in the widgets folder
			
			/*
				Notice the body down below. The body actually 
				displays one of the widgets from the array. Initially, 
				the body displays widget with all the news. But as you press
				on different tabs, currentIndex gets updated in this widget causing setState()
				to run causing body to run again causing different data to be loaded on the screen
				as the AllPost() widget gets called with different params
			*/
			
			body: widgetList[currentTab],
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					Navigator.pushNamed(context, '/newPost', arguments: {
						'postType': allTabNames[currentTab]
					});
					setState(() {
						tabName = allTabNames[currentTab];
					});
				},
				child: const Icon(
					Icons.add,
					size: 36,
				)
			),
		));
	}
}
