import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _museos = _firestore.collection('Places').doc('ObfFIHW4HQdXXMgHkUNU').collection('Museos');

class DataBase{

static Stream<QuerySnapshot> readMuseos() {
    return _museos.snapshots();
  }

}