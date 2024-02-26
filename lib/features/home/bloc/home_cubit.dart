// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:coody/core/models/categories_model.dart';
// import 'package:coody/core/models/offers_model.dart';
// import 'package:coody/features/home/bloc/home_State.dart';

// class HomeCubit extends Cubit<HomeStates> {
//   HomeCubit() : super(HomeInitState());

//   String location = '6 Cotber';
//   String username = 'Yasin';
//   List<OffersModel>? listOffers = [];
//   List<CategoriesModel>? listcatgory = [];
//   void getdata() async {
//     emit(ItemLoadingState());
//     getcategories();
//     getoffereesc();
//   }

//   void getcategories() async {
    // listcatgory!.clear();
    // listcatgory!.insert(
    //     0,
    //     CategoriesModel(
    //         selete: true,
    //         text: 'All',
    //         urlimage: 'https://i.ytimg.com/vi/QsCByv3Udpc/maxresdefault.jpg'));
//     try {
//       FirebaseFirestore.instance
//           .collection('offersc')
//           .where('isenable', isEqualTo: true)
//           .snapshots()
//           .listen((event) {
//         for (var element in event.docs) {
//           listcatgory!.add(CategoriesModel.fromJson(element));
//         }
//       });
//     } catch (e) {
//       emit(ItemErrorState(error: e.toString()));
//     }
//   }

//   void getoffereesc() async {
//     List<OffersModel>? listOffers = [];
//     try {
      // FirebaseFirestore.instance
      //     .collection('offersc')
      //     .where('isenable', isEqualTo: true)
      //     .snapshots()
//           .listen((event) {
//         event.docs.forEach((element) {
//           listOffers.add(OffersModel.fromJson(element));
//         });
//       });
//     } catch (e) {
//       emit(ItemErrorState(error: e.toString()));
//     }
//   }
// }
