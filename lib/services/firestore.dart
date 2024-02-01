import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  //get collection of notes
  final CollectionReference books =
      FirebaseFirestore.instance.collection("books");

  //create
  Future<void> addBook(String bookName, String authorName, int pageNumber) {
    return books.add({
      "Bookname": bookName,
      "Authorname": authorName,
      "pageNumber": pageNumber,
    });
  }

  //read
  Stream<QuerySnapshot> getBooksStream() {
    final BooksStream = books.orderBy("Bookname", descending: true).snapshots();

    return BooksStream;
  }

  //update
  Future<void> updateBook(
      String docID, String bookName, String authorName, int pageNumber) {
    return books.doc(docID).update({
      "Bookname": bookName,
      "Authorname": authorName,
      "pageNumber": pageNumber,
    });
  }

  //delete
  Future<void> deleteBook(String docID) {
    return books.doc(docID).delete();
  }
}
