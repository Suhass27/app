import 'package:flutter/material.dart'; 
import 'package:campus_connect/widgets/my_account_card_widget.dart';
import 'package:campus_connect/db/local_db.dart';
import 'package:campus_connect/db/sessions.dart';

/*
	This is a very straighforward file.
	Keep looking at the actual screen on phone and read code
	from here. You will have no issue understanding what is going on
*/

class Account extends StatelessWidget {
	const Account({ Key? key }) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
	
		String? signedInPerson = activeUser['campusID'];
		signedInPerson ??= 'default';
		
		/*
			In case sessions are not set (no user is active), 
			we show the profile of our "deafult user" in place of active user,
			because there is no active user right now

			We are just trying to prevent some runtime null errors
		*/

		List<String> academicYearConversion = ['Not a Student', 'First-Year Student', 'Sophomore Student', 'Junior-Year Student', 'Final-Year Student'];
		int academicYear = int.parse(database['campusConnect']['enrolledStudents'][signedInPerson]['academicYear']);
		
		return(Scaffold(
			body: SafeArea(
				child: Stack(
					children: [
						IconButton(
							onPressed: () => Navigator.pop(context),
							icon: const Icon(Icons.arrow_back_ios),
						), 
						Center(
							child: Padding(
								padding: const EdgeInsets.fromLTRB(15, 35, 15, 10),
								child: SingleChildScrollView(
									child: Column(
										children: [
											CircleAvatar(
												radius: MediaQuery.of(context).size.width * 0.25, 
												backgroundImage: const AssetImage('assets/images/user.png'),
												backgroundColor: Colors.transparent,
											),
											const SizedBox(height: 20),
											Text(database['campusConnect']['enrolledStudents'][signedInPerson]['firstName'] + ' ' + database['campusConnect']['enrolledStudents'][signedInPerson]['lastName'], 
												style: TextStyle(
													fontSize: 30, 
													color: Colors.teal[700],
													fontFamily: 'Ottoman'
												)
											),
											Row(
												mainAxisAlignment: MainAxisAlignment.center,
												children: [
													Text('${ academicYearConversion[academicYear] } at LUMS'),
												]
											),
											const SizedBox(height: 23),

											/*
												Notice the my card widget. MyCard widget
												returns a tile for us that we displaying on the page. 
												We pass the following info to this card: 
												1) leading icon
												2) tile title
												3) tile subtitle (which comes from user's info store by admins in the DB)
											*/
											
											MyCard(icon: Icon(Icons.apartment_outlined, color: Colors.teal[600], size: 33), tileTile: 'School', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['school']),
											MyCard(icon: Icon(Icons.receipt_long_outlined, color: Colors.teal[600], size: 33), tileTile: 'Degree Program', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['degreeProgram']),
											MyCard(icon: Icon(Icons.schedule_outlined, color: Colors.teal[600], size: 33), tileTile: 'Academic Year', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['academicYear']),
											MyCard(icon: Icon(Icons.checklist_outlined, color: Colors.teal[600], size: 33), tileTile: 'Credits Completed', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['creditsTaken']),
											MyCard(icon: Icon(Icons.star_outlined, color: Colors.teal[600], size: 33), tileTile: 'CGPA', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['cgpa']),
											MyCard(icon: Icon(Icons.school_outlined, color: Colors.teal[600], size: 33), tileTile: 'Graduation Year', tileSubtitle: database['campusConnect']['enrolledStudents'][signedInPerson]['graduationYear']),
										],
									),
								),
							),
						)
					], 
				)
			)
		));
	}
}
