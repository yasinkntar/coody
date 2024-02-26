class OptionItem {
  final String title;
  final bool isModey;
  final double price;

  const OptionItem(this.title, this.isModey, this.price);
}

class Optiongroupe {
  static const s = OptionItem('small', true, 65);
  static const m = OptionItem('middle', true, 85);
  static const l = OptionItem('Large', true, 95);

  static const option = OptionItem('Staff craft', false, 30);
  static const size = <OptionItem>[s, m, l];
  static const options = <OptionItem>[option];
}
