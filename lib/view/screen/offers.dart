import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:posts/controller/productdetails_controller.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});
  @override
  Widget build(BuildContext context) {
    Catalog2Controller controller = Get.put(Catalog2Controller());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather Forecast",
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
                  Text("جاري تحميل بيانات الطقس...",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.cgModel?.list?.length ?? 0,
            itemBuilder: (context, index) {
              var weather = controller.cgModel?.list?[index];
              var temp = weather?.main?.temp?.toStringAsFixed(1) ?? "غير متوفر";
              var weatherIcon = weather?.weather?.first.icon ?? "03d";

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
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
                                  "${controller.cgModel?.city?.name ?? 'غير متوفر'}, ${controller.cgModel?.city?.country ?? ''}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "درجة الحرارة: $temp°C",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
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
                              "${weather?.main?.tempMin?.toStringAsFixed(1) ?? 'غير متوفر'}°C",
                              Icons.arrow_downward,
                            ),
                            _buildWeatherInfo(
                              "الحد الأقصى",
                              "${weather?.main?.tempMax?.toStringAsFixed(1) ?? 'غير متوفر'}°C",
                              Icons.arrow_upward,
                            ),
                            _buildWeatherInfo(
                              "الغيوم",
                              "${weather?.clouds?.all ?? 'غير متوفر'}%",
                              Icons.cloud,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "التاريخ: ${weather?.dtTxt?.toString() ?? 'غير متوفر'}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
}
