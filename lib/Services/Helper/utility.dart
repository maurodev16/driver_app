import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rider_app/Models/UserModel/userModel.dart';

User firebaseUser;
////
DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

///
DatabaseReference userRideInfoRef =
    FirebaseDatabase.instance.reference().child("RideRequests").push();

///
final FirebaseAuth auth = FirebaseAuth.instance;
final userDataStored = GetStorage();
UserModel userCurrentInfoModel;
