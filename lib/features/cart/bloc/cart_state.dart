class CartStates {}

class CartInitState extends CartStates {}

class CartLodingState extends CartStates {}

class CartSuccessState extends CartStates {}

class CartErrorState extends CartStates {
  final String error;

  CartErrorState( {required this.error});
}


