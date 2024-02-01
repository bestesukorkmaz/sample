import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //firestore

  final FirestoreServices firestoreServices = FirestoreServices();

  // Text controllers
  final TextEditingController yazarController = TextEditingController();
  final TextEditingController kitapAdiController = TextEditingController();
  final TextEditingController sayfaSayisiController = TextEditingController();
  //open a dialog vox to add book
  void openBookbox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Yazar'),
              controller: yazarController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Kitap Adı'),
              controller: kitapAdiController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Sayfa sayısını giriniz'),
              controller: sayfaSayisiController,
            ),
            ElevatedButton(
              onPressed: () {
                int sayfaSayisi = int.tryParse(sayfaSayisiController.text) ?? 0;
                if (docID == null) {
                  // Yeni kitap ekle

                  if (sayfaSayisi != 0) {
                    firestoreServices.addBook(
                      kitapAdiController.text,
                      yazarController.text,
                      sayfaSayisi,
                    );

                    Navigator.pop(
                        context); // Kitap ekledikten sonra dialog penceresini kapat
                  } else {
                    // Hata: Sayfa sayısını bir tamsayıya dönüştüremiyoruz
                    // Kullanıcıya bir hata mesajı göster
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Hata'),
                        content: Text('Sayfa sayısı tam sayı olmalıdır.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Hata mesajını kapat
                            },
                            child: Text('Tamam'),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  firestoreServices.updateBook(
                    docID,
                    kitapAdiController.text,
                    yazarController.text,
                    sayfaSayisi,
                  );
                }
                yazarController.clear();
                kitapAdiController.clear();
                sayfaSayisiController.clear();
                Navigator.pop(context);
              },
              child: Text("Ekle"),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Books")),
      floatingActionButton: FloatingActionButton(
        onPressed: openBookbox,
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreServices.getBooksStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List booksList = snapshot.data!.docs;
            return ListView.builder(
                itemCount: booksList.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = booksList[index];
                  String docId = document.id;
                  String bookName = document['Bookname'];
                  String authorName = document['Authorname'];
                  int pageCount = document['pageNumber'];

                  return ListTile(
                    title: Text(bookName),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => openBookbox(docID: docId),
                          icon: const Icon(Icons.settings),
                        ),
                        IconButton(
                          onPressed: () => firestoreServices.deleteBook(docId),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    subtitle:
                        Text('Yazar: $authorName, Sayfa Sayısı: $pageCount'),
                  );
                });
          } else {
            return const Text("Hiç veri girilmedi");
          }
        },
      ),
    );
  }
}
