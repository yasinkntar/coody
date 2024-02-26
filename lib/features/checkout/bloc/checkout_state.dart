class CheckoutStates {}

class CheckoutInitState extends CheckoutStates {}

class CheckoutLodingState extends CheckoutStates {}

class CheckoutChangedTypeState extends CheckoutStates {}

class CheckoutChangedItemState extends CheckoutStates {}

class CheckoutSuccessState extends CheckoutStates {}

class PalecOrderSuccessState extends CheckoutStates {
  final String uuid;

  PalecOrderSuccessState({required this.uuid});
}

class CheckoutErrorState extends CheckoutStates {
  final String error;

  CheckoutErrorState({required this.error});
}
