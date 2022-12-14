import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/page/product/product_model.dart';

final showProductProvider = StreamProvider<List<ProductModel>>((ref) {
  final firebase = FirebaseFirestore.instance;

  final snap = firebase.collection('course').snapshots();
  final showproduct = snap.map(
    (snapshot) =>
        snapshot.docs.map((doc) => ProductModel.fromDoc(doc)).toList(),
  );
  return showproduct;
});
