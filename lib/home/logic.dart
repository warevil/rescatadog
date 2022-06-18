import '../db/dataHome.dart';

//Logic here

class HomeLogic {
  var all;
  var filteredPets;

  HomeLogic(var data) {
    this.all = data;
    this.filteredPets = data;
  }

  void filterByCategory(int selectedCategory) {
    if (selectedCategory == 0) {
      filteredPets = all;
    } else {
      filteredPets = all
          .where((i) => i["category"] == categories[selectedCategory]["name"])
          .toList();
    }
  }
}
