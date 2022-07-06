import 'package:campus_connect/db/sessions.dart';
import 'package:campus_connect/db/local_db.dart';

/*
	We are using this function for handling thumbs up / down
	reaction to our hashtags. Notice that it returns a bool. 
	If it returns true, we go ahead and update the state of
	our home widget where the thumbs icons are being shown
	(by incrementing or decrementing the thumbs count)

	This function will return true ONLY when the active user 
	has not already reacted to a current hashtag. If they have already
	reacted, we return false and no DB or state updation occurs

	For knowing if you have already reacted to this hahstag or not, we use a 
	"reactedBy []" array in our DB in every hashtag's object. 
	If your campusID is found in that array, it means you have 
	already reacted to this hashtag. Hence, we do not update DB and return false 
	to indicate no updation in state of home widget as well
*/

var thisUser = activeUser['campusID'];
bool value = false;

Future<bool> handleThumbsUpDown(String thumbsDirection, int hashtagId) async {
	database['campusConnect']['hashtags'].forEach((item) {
		if (item['id'] == hashtagId) {
			if (!item['reactedBy'].contains(thisUser)) {
				thumbsDirection == 'up' ? item['agree'] += 1 : item['disagree'] += 1;
				// print('${item['agree']} / ${item['disagree']}');
				item['reactedBy'].add(thisUser);
				
				value = true;
			}
			else if (item['reactedBy'].contains(thisUser)) {
				value = false;
			}
		}
	});
	return value;
}
