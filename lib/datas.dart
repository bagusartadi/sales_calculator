import 'package:sales_calculator/moduls/xmoduls.dart';

const UserCal saya = UserCal(nama: 'artadi');

final List<UserCal> onlineUsers = [
  const UserCal(
      nama: 'maria', email: "maria@gmail.com", password: 'sdfhglhjdf'),
  const UserCal(nama: 'novan', email: 'novan@gmail.com', password: 'asasfff'),
  const UserCal(nama: 'riany', email: 'riany@gmail.com', password: 'wengv235')
];

final List<Government> pemerintah = [
  const Government(tax: 11.0, service: 10.0),
];

final List<Item> items = [
  const Item(itemName: "The Cafe-Breakfast", itemHarga: 200000),
  const Item(itemName: "The Cafe-Lunch", itemHarga: 280000),
];

final List<RoomType> roomtypes = [
  const RoomType(pax: 2, jumlah: 10, tipeKamar: 'grandeur', bar: 1500000),
  const RoomType(
      pax: 2, jumlah: 10, tipeKamar: 'grandeur deluxe', bar: 1750000),
  const RoomType(
      pax: 2, jumlah: 10, tipeKamar: 'signature ocean', bar: 2000000),
  const RoomType(pax: 3, jumlah: 5, tipeKamar: 'royal ocean', bar: 3000000),
];

final List<Inclusion> inclusionx = [
  Inclusion(namaOutlet: 'Cafe', element: 'breakfast', harga: 300000),
  //if(daily selected)=> total night(paid+bonus nights)XInclusion.hargaXroomtype.pax; extra adult or child if any;
  Inclusion(namaOutlet: 'Table8', element: 'lunch', harga: 350000),
  Inclusion(namaOutlet: 'Soleil', element: 'dinner', harga: 400000),
];

final List<Inclusion> extraAdultx = [
  Inclusion(namaOutlet: 'Cafe', element: 'breakfast', harga: 300000),
  //if(daily selected)=> total night(paid+bonus nights)XInclusion.hargaXroomtype.pax; extra adult;
  Inclusion(namaOutlet: 'Table8', element: 'lunch', harga: 350000),
  Inclusion(namaOutlet: 'Soleil', element: 'dinner', harga: 400000),
];

final List<Inclusion> extraChildx = [
  Inclusion(namaOutlet: 'Cafe', element: 'breakfast', harga: 150000),
  //if(daily selected)=> total night(paid+bonus nights)XInclusion.hargaXroomtype.pax; extra child;
  Inclusion(namaOutlet: 'Table8', element: 'lunch', harga: 175000),
  Inclusion(namaOutlet: 'Soleil', element: 'dinner', harga: 200000),
];

final List<String>? pilihLos = [
  '',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];

final List<String>? pilihPax = ['', '1', '2', '3', '4', '5', '6', '7', '8'];

final List<String> pilihKali = [
  '',
  'daily',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18',
  '19',
  '20',
  '21',
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
  '31'
];

final List<XeCurrency> currencyList = [
  const XeCurrency(
      currencyLocal: 'Rupiah', toCurrency: 'USD', toAmount: 0.000067),
  //to convert back to Rp = (1-toAmount)/toAmount
  const XeCurrency(
      currencyLocal: 'Rupiah', toCurrency: 'AUD', toAmount: 0.000097),
  const XeCurrency(
      currencyLocal: 'Rupiah', toCurrency: 'EUR', toAmount: 0.000060),
  const XeCurrency(
      currencyLocal: 'Rupiah', toCurrency: 'JPY', toAmount: 0.007822),
  const XeCurrency(
      currencyLocal: 'Rupiah', toCurrency: 'CNY', toAmount: 0.000452),
];

final List<String> currencyx = ['RP', 'USD', 'AUD', 'EUR', 'JPY', 'CNY'];

final List<String> markUpx = [
  '0.0',
  '2.5',
  '5.0',
  '7.5',
  '10.0',
  '12.5',
  '15.0',
  '17.5',
  '20.0',
  '22.5',
  '25.0'
];
