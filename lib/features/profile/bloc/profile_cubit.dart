import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coody/core/models/payment_model.dart';
import 'package:coody/features/profile/bloc/profile_statue.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coody/core/models/users_addrees.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitState());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _imagePath;
  File? file;
  String? profileUrl;

  User? user;
  String? userID;

  Future<void> getUser() async {
    user = FirebaseAuth.instance.currentUser;
    userID = user?.uid;
  }

  uploadImageToFireStore(File image, String imageName) async {
    final FirebaseStorage storage =
        FirebaseStorage.instanceFor(bucket: 'gs://conloe.appspot.com');
    Reference ref =
        storage.ref().child('Users/${_auth.currentUser!.uid}$imageName');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> pickImage() async {
    emit(ProfileLodingState());
    getUser();

    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _imagePath = pickedImage.path;
      file = File(pickedImage.path);
    }
    emit(ProfileUpdateImage(pathimage: _imagePath!));
    profileUrl = await uploadImageToFireStore(file!, 'doc');
    FirebaseFirestore.instance.collection('Users').doc(userID).set({
      'image': profileUrl,
    }, SetOptions(merge: true));
    emit(ProfileSuccessState());
  }

  Future<void> updateData(String name, email, phone, bio) async {
    emit(ProfileLodingState());
    getUser();
    FirebaseFirestore.instance.collection('Users').doc(user!.uid).set({
      "name": name,
      "email": email,
      "phone": phone,
      "bio": bio,
    }, SetOptions(merge: true));

    await user?.updateDisplayName(name);
    emit(ProfileSuccessState());
  }

  Future<void> addaddress(UserAddressc addressc) async {
    emit(ProfileLodingState());
    getUser();
    addressc.uuid = user!.uid;
    FirebaseFirestore.instance.collection('Addressc').doc(user!.uid).set({
      'Address': addressc.address,
      'Appartment': addressc.appartment,
      'Labelas': addressc.labelas,
      'Postcode': addressc.postcode,
      'street': addressc.street,
      'uuid': addressc.uuid
    }, SetOptions(merge: true));
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(user!.uid)
    //     .collection('Address').doc().
    //     .add({
    //   'Address': addressc.address,
    //   'Appartment': addressc.appartment,
    //   'Labelas': addressc.labelas,
    //   'Postcode': addressc.postcode,
    //   'street': addressc.street
    // });
    // FirebaseFirestore.instance
    //     .collection('Users')
    //     .doc(user!.uid)
    //     .collection(user!.uid).
    //     .add(addressc.toJson());
    // final db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    // db.update({
    //   "Address": FieldValue.arrayUnion([addressc.toJson()]),
    // });
    // washingtonRef.update({
    //   "Address": FieldValue.arrayUnion([addressc.toJson()]),
    // });

    // update({
    //   "Address": {
    //     'Address': addressc.address,
    //     'Appartment': addressc.appartment,
    //     'Labelas': addressc.labelas,
    //     'Postcode': addressc.postcode,
    //     'street': addressc.street
    //   }
    // }.);
    // {addressc.toJson()} as Map<String, dynamic>, SetOptions(merge: true));

    emit(ProfileSuccessState());
  }

  Future<void> removeaddress(UserAddressc addressc) async {
    emit(ProfileLodingState());
    getUser();
    final db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    db.update({
      "Address": FieldValue.arrayRemove([addressc.toJson()]),
    });
    emit(ProfileSuccessState());
  }

  Future<void> addPayment(PaymentModel paymeny) async {
    emit(ProfileLodingState());
    getUser();
    FirebaseFirestore.instance.collection('Payment').doc(user!.uid).set({
      'cardHolderName': paymeny.cardHolderName,
      'cardNumber': paymeny.cardNumber,
      'cvv': paymeny.cvv,
      'expiryDate': paymeny.expiryDate,
      'uuid': user!.uid
    }, SetOptions(merge: true));
    // final db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    // db.update({
    //   "payment": FieldValue.arrayUnion([paymeny.toJson()]),
    // });
    emit(ProfileSuccessState());
  }

  Future<void> removePayment(PaymentModel paymeny) async {
    emit(ProfileLodingState());
    getUser();
    final db = FirebaseFirestore.instance.collection("Users").doc(user!.uid);
    db.update({
      "payment": FieldValue.arrayRemove([paymeny.toJson()]),
    });
    emit(ProfileSuccessState());
  }
}
