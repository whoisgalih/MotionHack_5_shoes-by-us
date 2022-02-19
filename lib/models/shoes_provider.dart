import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:uuid/uuid.dart';

class ShoesProvider with ChangeNotifier {
  var uuid = Uuid();

  List<Shoes> _shoes = [];

  List<Shoes> get shoes => _shoes;

  Shoes? findById(String id) =>
      _shoes.firstWhereOrNull((shoe) => shoe.id == id);

  findIndexById(String id) {
    for (var i = 0; i < _shoes.length; i++) {
      if (_shoes[i].id == id) {
        return i;
      }
    }
    return null;
  }

  findIndexByNameAndSize(String name, int? size) {
    for (var i = 0; i < _shoes.length; i++) {
      if (_shoes[i].name == name) {
        if (_shoes[i].selectedSize == size) {
          return i;
        }
      }
    }
    return null;
  }

  addShoes(Shoes shoe) {
    int? index = findIndexByNameAndSize(shoe.name, shoe.selectedSize);
    if (index == null) {
      final Shoes _shoe = Shoes(
        id: uuid.v1(),
        image: shoe.image,
        name: shoe.name,
        brand: shoe.brand,
        desc: shoe.desc,
        price: shoe.price,
        sizes: shoe.sizes,
        discountPercent: shoe.discountPercent,
        selectedSize: shoe.selectedSize,
        quantity: 1,
      );
      _shoes.add(_shoe);
    }
    notifyListeners();
  }

  editShoes(Shoes shoe) {
    int index = findIndexById(shoe.id);
    _shoes[index] = shoe;
    notifyListeners();
  }

  removeShoes(Shoes shoe) {
    int index = findIndexById(shoe.id);
    _shoes.removeAt(index);
    notifyListeners();
  }

  clearAll() {
    _shoes.clear();
    notifyListeners();
  }
}
