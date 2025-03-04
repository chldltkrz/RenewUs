import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renewus/data/model/appointment.dart';
import 'package:renewus/data/model/counselor.dart';

/*
  String? id;
  String? counselorEmail;
  String? counselorName;
  double? rating;
  int? totalCareer;
  String? introduction;
  String? personalOpinion;
  List<String>? profiles;
  List<String>? reviews;
  List<Appointment>? appointments;
  String? imageUrl;
  DateTime? createdAt;
  int? price30Min;
  int? price50Min;
  bool? isCounselor;
*/

class CounselorRepository {
  Future<List<Counselor>?> getAll() async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('counselor');
      // 3. 값 불러오기
      final result = await collectionRef.get();

      // 4. 값 가져오기
      final docs = result.docs;

      return docs.map((doc) {
        final map = doc.data();
        final newMap = {'id': doc.id, ...map};
        final dataa = Counselor.fromJson(newMap);
        return dataa;
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 1. Create
  Future<bool> insert(
      {required String counselorEmail,
      required String counselorName,
      required double rating,
      required int totalCareer,
      required String introduction,
      required String personalOpinion,
      required List<String> profiles,
      required List<String> reviews,
      required List<Appointment> appointments,
      required String imageUrl,
      required int price30Min,
      required int price50Min,
      required bool isCounselor}) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('counselor');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc();
      // 4. 값 쓰기
      await docRef.set({
        'counselorEmail': counselorEmail,
        'counselorName': counselorName,
        'rating': rating,
        'totalCareer': totalCareer,
        'introduction': introduction,
        'personalOpinion': personalOpinion,
        'profiles': profiles,
        'reviews': reviews,
        'appointments': appointments.map((e) => e.toJson()).toList(),
        'imageUrl': imageUrl,
        'price30Min': price30Min,
        'price50Min': price50Min,
        'isCounselor': isCounselor,
        'createAt': DateTime.now().toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 2. Read
  Future<Counselor?> getOne(String id) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('counselor');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 값 불러오기
      final doc = await docRef.get();
      return Counselor.fromJson(
        {'id': doc.id, ...doc.data()!},
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 3. Update
  Future<bool> update({
    required String id,
    required String counselorName,
    required String counselorEmail,
    required double rating,
    required int totalCareer,
    required String introduction,
    required String personalOpinion,
    required List<String> profiles,
    required List<String> reviews,
    required List<Appointment>? appointments,
    required String imageUrl,
    required int price30Min,
    required int price50Min,
    required bool isCounselor,
  }) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('counselor');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 값 업데이트
      // update 와 set의 차이점 -> set은 도큐먼트가 없으면 생성함
      await docRef.update({
        'counselorName': counselorName,
        'counselorEmail': counselorEmail,
        'rating': rating,
        'totalCareer': totalCareer,
        'introduction': introduction,
        'personalOpinion': personalOpinion,
        'profiles': profiles.map((e) => e.toString()).toList(),
        'reviews': reviews.map((e) => e.toString()).toList(),
        'appointments': appointments?.map((e) => e.toJson()).toList(),
        'imageUrl': imageUrl,
        'price30Min': price30Min,
        'price50Min': price50Min,
        'isCounselor': isCounselor,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 4. Delete
  Future<bool> delete(String id) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('counselor');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 값 삭제
      await docRef.delete();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<List<Counselor>> postListStream() {
    final firestore = FirebaseFirestore.instance;
    final collectionRef =
        firestore.collection('counselor').orderBy('createAt', descending: true);
    final stream = collectionRef.snapshots();

    // List<Post> 형태로 변경
    final newStream = stream.map((event) {
      return event.docs.map((e) {
        return Counselor.fromJson({
          'id': e.id,
          ...e.data(),
        });
      }).toList();
    });
    return newStream;
  }

  Stream<Counselor?> postStream(String id) {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('counselor');
    final docRef = collectionRef.doc(id);
    final stream = docRef.snapshots();
    final newstream = stream.map(
      (event) {
        if (event.data() == null) {
          return null;
        }
        return Counselor.fromJson({
          'id': event.id,
          ...event.data()!,
        });
      },
    );
    return newstream;
  }
}
