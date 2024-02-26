class ProfileItem {
  final String title;
  final String icon;

  const ProfileItem(this.title, this.icon);
}

class Profilegroupe {
  static const personal = ProfileItem('Personal Info', 'assets/person.png');
  static const addresses = ProfileItem('Addresses', 'assets/maps.png');
  static const cart = ProfileItem('Cart', 'assets/cart.png');
  static const favourite = ProfileItem('Favourite', 'assets/favourite.png');
  static const notifications =
      ProfileItem('Notifications', 'assets/notifications.png');
  static const paymentMethod =
      ProfileItem('Payment Method', 'assets/payment.png');

  static const faqs = ProfileItem('FAQs', 'assets/help.png');
  static const reviews = ProfileItem('User Reviews', 'assets/userreviews.png');
  static const settings = ProfileItem('Settings', 'assets/settings.png');
  static const logOut = ProfileItem('Log Out', 'assets/logout.png');
  static const groupe = <ProfileItem>[
    personal,
    addresses,
  ];
  static const groupe2 = <ProfileItem>[
    cart,
    favourite,
    notifications,
    paymentMethod
  ];
  static const groupe3 = <ProfileItem>[
    faqs,
    reviews,
    settings,
  ];
  static const groupe4 = <ProfileItem>[logOut];
}
