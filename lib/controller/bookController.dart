import 'dart:io';
import 'dart:typed_data';
import 'package:admin_ourbook/model/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class isUplodingData extends GetxController {
  ImagePicker image = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late File file;
  RxString imageUrl = "".obs;
  RxString pdfUrl = "".obs;
  RxBool islodingImage = false.obs;
  RxBool islodingPdf = false.obs;
  RxBool isPostUploding = false.obs;
  RxBool isSectionUploding = false.obs;
  RxBool isStartLoding = false.obs;

  @override
  void onReady() {
    super.onReady();
    getSection();
  }

  List<QueryDocumentSnapshot> data = [];
  void getSection() async {
    isStartLoding.value = true;
    CollectionReference colldction = firestore.collection('sectionBook');
    QuerySnapshot getSections = await colldction.get();
    data.addAll(getSections.docs);
    print('================================sectionn' + data.length.toString());
    isStartLoding.value = false;
  }

  void getImage() async {
    islodingImage.value = true;
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        requestFullMetadata: false,
        maxHeight: 1920,
        maxWidth: 1920);
    if (image != null) {
      file = File(image.path);
      uploadImageToFirebase(file);
      islodingImage.value = false;
    }
  }

  void createBook({
    required String sectionId,
    required String title,
    required String description,
    required String pageNo,
    required String titleSmal,
  }) {
    isPostUploding.value = true;
    BookModel model = BookModel(
        title: title,
        description: description,
        imageUrl: imageUrl.toString(),
        pageNo: pageNo,
        pdfUrl: pdfUrl.toString(),
        sectionId: sectionId,
        titleLower: titleSmal,
        createdAt: FieldValue.serverTimestamp());
    CollectionReference collection = firestore.collection('bookInfo');
    collection.add(model.toMap()).then((value) {
      print('___________________________sesful' + value.toString());
    }).catchError((error) => print(
        "+++++++++++++++++++++++++++++++++++++++++++Failed to add book information: $error"));
    isPostUploding.value = false;
    imageUrl = ''.obs;
    pdfUrl = ''.obs;
  }

  void creatSection(String sectionName) async {
    isSectionUploding.value = true;
    CollectionReference colldction = firestore.collection('sectionBook');
    colldction
        .add({
          'name': sectionName,
        })
        .then((value) => print("================================section Added"))
        .catchError((error) =>
            print("===============================Failed to add user: $error"));
    isSectionUploding.value = false;
  }

  void uploadImageToFirebase(image) async {
    islodingImage.value = true;
    var filename = basename(file.path);
    final storageRef = storage.ref().child("images/$filename");
    var response = await storageRef.putFile(image);
    var downloadurl = await storageRef.getDownloadURL();
    imageUrl.value = downloadurl;
    print('print download Url========$downloadurl');
    islodingImage.value = false;
  }

  void pickPdf() async {
    islodingPdf.value = true;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null) {
      File file = File(result.files.single.path!);
      if (file.existsSync()) {
        Uint8List fileBytes = await file.readAsBytes();
        String fileName = result.files.first.name;

        // Upload file
        final respons = await FirebaseStorage.instance
            .ref('files/$fileName')
            .putData(fileBytes);
        var downloadPdf = await respons.ref.getDownloadURL();
        pdfUrl.value = downloadPdf;
        print('print download UrlPdf========$pdfUrl');
        islodingPdf.value = false;
      } else {
        print('file do not exite');
      }
    } else {
      print('file do not select');
    }
  }
}
