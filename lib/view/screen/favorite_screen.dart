import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/controller/productdetails_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int itemsPerPage = 4;
    final currentPage = 0.obs;
    
    Catalog2Controller controller = Get.put(Catalog2Controller());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "حالات الطقس",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: GetBuilder<Catalog2Controller>(
        builder: (controller) {
          if (controller.cgModel == null) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text("جاري التحميل...", style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }

          final totalItems = controller.cgModel!.list!.length;
          final totalPages = (totalItems / itemsPerPage).ceil();

          return Column(
            children: [
              Expanded(
                child: Obx(() {
                  final startIndex = currentPage.value * itemsPerPage;
                  final endIndex = (startIndex + itemsPerPage).clamp(0, totalItems);
                  final currentItems = controller.cgModel!.list!.sublist(startIndex, endIndex);

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: currentItems.length,
                    itemBuilder: (context, index) {
                      var weather = currentItems[index];
                      var temp = weather.main?.temp?.toStringAsFixed(1) ?? "غير متوفر";
                      var weatherIcon = weather.weather?.first.icon ?? "03d";

                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.lightBlue],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "درجة الحرارة: $temp°C",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on, color: Colors.white, size: 16),
                                            const SizedBox(width: 4),
                                            Text(
                                              "${controller.cgModel?.city?.name ?? 'غير متوفر'}",
                                              style: const TextStyle(color: Colors.white, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    CachedNetworkImage(
                                      imageUrl: "https://openweathermap.org/img/wn/$weatherIcon@2x.png",
                                      height: 80,
                                      width: 80,
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => const Icon(Icons.error),
                                    ),
                                  ],
                                ),
                                const Divider(color: Colors.white30, height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    _buildWeatherInfo(
                                      "الحد الأدنى",
                                      "${weather.main?.tempMin?.toStringAsFixed(1) ?? 'غير متوفر'}°C",
                                      Icons.arrow_downward,
                                    ),
                                    _buildWeatherInfo(
                                      "الحد الأقصى",
                                      "${weather.main?.tempMax?.toStringAsFixed(1) ?? 'غير متوفر'}°C",
                                      Icons.arrow_upward,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Obx(() => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPaginationButton(
                        icon: Icons.arrow_back_ios,
                        onPressed: currentPage.value > 0
                            ? () => currentPage.value--
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(totalPages, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: MaterialButton(
                              minWidth: 40,
                              height: 40,
                              color: currentPage.value == index ? Colors.blue : Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () => currentPage.value = index,
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: currentPage.value == index ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(width: 16),
                      _buildPaginationButton(
                        icon: Icons.arrow_forward_ios,
                        onPressed: currentPage.value < totalPages - 1
                            ? () => currentPage.value++
                            : null,
                      ),
                    ],
                  ),
                )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWeatherInfo(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return MaterialButton(
      minWidth: 40,
      height: 40,
      padding: EdgeInsets.zero,
      color: onPressed != null ? Colors.blue : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: onPressed != null ? Colors.white : Colors.grey,
        size: 20,
      ),
    );
  }
}
