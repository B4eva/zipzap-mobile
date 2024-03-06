enum ProductType { btc, usdt, eth, applegc, xpr }

class Product {
  String? phoneNumber;
  String? description;
  String? vendorName;
  String? name;
  String? amount;
  ProductType? type;

  Product(
      {required this.phoneNumber,
      required this.description,
      required this.name,
      required this.amount,
      required this.vendorName,
      required this.type});
}

List<Product> ProductsList = [
  Product(
      phoneNumber: '+237 673943715',
      vendorName: 'Mami Asabah Yams',
      name: 'Yams',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      amount: 'FCFA 20,000',
      type: ProductType.btc),
  Product(
      phoneNumber: '739404030',
      name: 'Arabica',
      vendorName: 'Coffee shop',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      amount: 'FCFA 20,000',
      type: ProductType.applegc),
  Product(
      phoneNumber: '574922300',
      name: 'Femal Handback',
      vendorName: 'Samira Design',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      amount: 'FCFA 20,000',
      type: ProductType.eth),
  Product(
      phoneNumber: '920038848',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      name: 'Wooden Bed',
      vendorName: 'Papa Ajasco',
      amount: 'FCFA 1,000',
      type: ProductType.btc),
  Product(
      phoneNumber: '374003441',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      name: 'Machette ',
      vendorName: 'Iron Bender',
      amount: 'FCFA 2,000',
      type: ProductType.usdt),
  Product(
      phoneNumber: '823482394',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      name: 'Core I5',
      vendorName: 'Windows inc',
      amount: 'FCFA 9,000',
      type: ProductType.xpr),
  Product(
      phoneNumber: '243020340',
      description:
          'Lorem ipsum dolor campuim isi Cavia wine wip loop maize aslem coffe slim xendoe',
      name: 'Ipone XR',
      vendorName: 'Santa Lucia',
      amount: 'FCFA 1,500',
      type: ProductType.btc)
];
