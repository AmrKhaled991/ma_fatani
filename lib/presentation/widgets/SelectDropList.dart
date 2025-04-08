import 'package:flutter/material.dart';

class City {
  final String name;
  final double latitude;
  final double longitude;

  const City({
    required this.name,
    required this.latitude,
    required this.longitude,
  });
}

class CitiesData {
  CitiesData._();

  static const List<City> allCities = [
    City(name: "Cairo", latitude: 30.033333, longitude: 31.233334),
    City(name: "Alexandria", latitude: 31.205753, longitude: 29.924526),
    City(name: "Giza", latitude: 30.013056, longitude: 31.208853),
    City(name: "Shubra El Kheima", latitude: 30.128611, longitude: 31.242222),
    City(name: "Port Said", latitude: 31.25654, longitude: 32.28411),
    City(name: "Suez", latitude: 29.97371, longitude: 32.52627),
    City(name: "Luxor", latitude: 25.687243, longitude: 32.639637),
    City(name: "Asyut", latitude: 27.180134, longitude: 31.189283),
    City(name: "Mansoura", latitude: 31.037933, longitude: 31.381523),
    City(name: "Tanta", latitude: 30.788469, longitude: 31.001949),
    City(name: "Aswan", latitude: 24.088938, longitude: 32.899830),
    City(name: "Ismailia", latitude: 30.604270, longitude: 32.272251),
    City(name: "Faiyum", latitude: 29.308402, longitude: 30.842850),
    City(name: "Zagazig", latitude: 30.587680, longitude: 31.502000),
    City(name: "Damietta", latitude: 31.417540, longitude: 31.814444),
    City(name: "Minya", latitude: 28.109880, longitude: 30.750300),
    City(name: "Damanhur", latitude: 31.050000, longitude: 30.466667),
    City(name: "Beni Suef", latitude: 29.066667, longitude: 31.083333),
    City(name: "Qena", latitude: 26.166667, longitude: 32.716667),
    City(name: "Sohag", latitude: 26.549999, longitude: 31.700001),
  ];
}

class CityDropdown extends StatefulWidget {
  final City selectedCity;
  final ValueChanged<City> onCitySelected;

  const CityDropdown({
    required this.selectedCity,
    required this.onCitySelected,
    Key? key,
  }) : super(key: key);

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown>
    with SingleTickerProviderStateMixin {
  late City selectedCity;
  late AnimationController expandController;
  late Animation<double> animation;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    selectedCity = widget.selectedCity;
    expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animation =
        CurvedAnimation(parent: expandController, curve: Curves.fastOutSlowIn);
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    setState(() => isExpanded = !isExpanded);
    isExpanded ? expandController.forward() : expandController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
              borderRadius: BorderRadius.circular(20.0),
              color: const Color(0xFFF8F8F8),
            ),
            child: Row(
              children: [
                Text(
                  selectedCity.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(),
                Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          axisAlignment: 1.0,
          sizeFactor: animation,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xFFDBDBDB)),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: const Color(0xFFF8F8F8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: CitiesData.allCities
                  .map((city) => _buildCityOption(city))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCityOption(City city) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedCity = city);
        toggleDropdown();
        widget.onCitySelected(city);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
        child: Text(
          city.name,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
