import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _museos = _firestore
    .collection('Places')
    .doc('ObfFIHW4HQdXXMgHkUNU')
    .collection('Museos');
final CollectionReference _cc = _firestore
    .collection('Places')
    .doc('5u9Fx6QvZlow14FvVN1G')
    .collection('Centros Comerciales');
final CollectionReference _iglesias = _firestore
    .collection('Places')
    .doc('6EQCNLUTgE2m51QbOX2H')
    .collection('Iglesias');
final CollectionReference _bibliotecas = _firestore
    .collection('Places')
    .doc('cvhcSpjMrtITkcd3VjsI')
    .collection('Bibliotecas');
final CollectionReference _parquesrecreativos = _firestore
    .collection('Places')
    .doc('kX8WBRTY8xj9yGPyKulT')
    .collection('Parques Recreativos');
final CollectionReference _miradores = _firestore
    .collection('Places')
    .doc('ma5hJBwI0xhhHqJPjboY')
    .collection('Miradores');
final CollectionReference _lugaresrepresentativos = _firestore
    .collection('Places')
    .doc('xzFVhkZnCi4EKI111KLG')
    .collection('Lugares Representativos');

class DataBase {
  static Stream<QuerySnapshot> readMuseos() {
    return _museos.snapshots();
  }

  static Stream<QuerySnapshot> readcc() {
    return _cc.snapshots();
  }

  static Stream<QuerySnapshot> readIglesias() {
    return _iglesias.snapshots();
  }

  static Stream<QuerySnapshot> readBibliotecas() {
    return _bibliotecas.snapshots();
  }

  static Stream<QuerySnapshot> readParquesRec() {
    return _parquesrecreativos.snapshots();
  }

  static Stream<QuerySnapshot> readMiradores() {
    return _miradores.snapshots();
  }

  static Stream<QuerySnapshot> readLugarRepre() {
    return _lugaresrepresentativos.snapshots();
  }
}
