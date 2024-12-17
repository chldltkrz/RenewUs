import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:renewus/data/model/appointment.dart';
import 'package:renewus/data/model/user.dart';

/*
  String id;
  String userEmail;
  String userName;
  String password;
  List<Appointment> appointments;
  String imageUrl;
  int chargedMoney;
  DateTime createdAt;
*/

class PostRepository {
  Future<List<Counselor>?> getAll() async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 값 불러오기
      final result = await collectionRef.get();

      // 4. 값 가져오기
      final docs = result.docs;
      return docs.map((doc) {
        final map = doc.data();
        final newMap = {'id': doc.id, ...map};
        return Counselor.fromJson(newMap);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 1. Create
  Future<bool> insert(
      {required String userEmail,
      required String userName,
      required String password,
      required String imageUrl}) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc();
      // 4. 값 쓰기
      await docRef.set({
        'userEmail': userEmail,
        'userName': userName,
        'password': password,
        'imageUrl': imageUrl,
        'appointments': [],
        'chargedMoney': 0,
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
      final collectionRef = firestore.collection('posts');
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
    required String usereName,
    required String userEmail,
    required String imageUrl,
    required List<Appointment> appointments,
    required int chargedMoney,
  }) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 문서참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 값 업데이트
      // update 와 set의 차이점 -> set은 도큐먼트가 없으면 생성함
      await docRef.update({
        'userName': usereName,
        'userEmail': userEmail,
        'imageUrl': imageUrl,
        'appointments': appointments.map((e) => e.toJson()).toList(),
        'chargedMoney': chargedMoney,
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
      final collectionRef = firestore.collection('posts');
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
        firestore.collection('posts').orderBy('createAt', descending: true);
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
    final collectionRef = firestore.collection('posts');
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
