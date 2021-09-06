import 'package:cloud_firestore/cloud_firestore.dart';

class UserChat {
  String id;
  String photoUrl;
  String name;
  String email;
  //String aboutMe;

  UserChat({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.email,
    //required this.aboutMe
  });

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    //String aboutMe = "";
    String photoUrl = "";
    String name = "";
    String email = "";

    /*try {
      aboutMe = doc.get('aboutMe');
    } catch (e) {}*/
    try {
      photoUrl = doc.get('photoUrl');
    } catch (e) {}
    try {
      email = doc.get('email');
    } catch (e) {}
    try {
      name = doc.get('name');
    } catch (e) {}
    return UserChat(
      id: doc.id,
      photoUrl: photoUrl,
      name: name,
      email: email,
      //aboutMe: aboutMe,
    );
  }
}
