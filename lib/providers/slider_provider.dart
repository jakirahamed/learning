import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final sliderimgProvider = Provider<List<String>>(
//   (ref) {
//     return [
//       'https://cdn.pixabay.com/photo/2022/08/01/09/32/daisies-7357753_960_720.jpg',
//       'https://cdn.pixabay.com/photo/2022/08/01/09/32/daisies-7357753_960_720.jpg',
//       'https://cdn.pixabay.com/photo/2022/08/01/09/32/daisies-7357753_960_720.jpg'
//     ];
//   },
// );

final sliderImgProvider = StreamProvider<List<dynamic>>((ref) {
  final firebase = FirebaseFirestore.instance;
  final snap = firebase.collection('slider').snapshots();
  final images = snap.map(
    (snapshot) => snapshot.docs
        .map(
          (doc) => doc.data()['img'],
        )
        .toList(),
  );
  return images;
});

final sliderpositionProvider = StateProvider<int>((ref) {
  return 0;
});
