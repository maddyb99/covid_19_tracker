import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';

Future<void> uploadLocation(LocationData location)async{
  CollectionReference collectionReference=Firestore.instance.collection("Location");

  DocumentReference documentReference=collectionReference.document(DateTime.now().toUtc().toIso8601String());
  await documentReference.setData({"location":{"latitude":location.latitude,"longitude":location.longitude}});
  print('uploaded');
}