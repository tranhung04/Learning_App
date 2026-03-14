class Weather {
  final String cityName;
  final double temperatureCelsius;
  final String description;
  final int humidity;
  final double windSpeed;

  const Weather({
    required this.cityName,
    required this.temperatureCelsius,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  Weather copyWith({
    String? cityName,
    double? temperatureCelsius,
    String? description,
    int? humidity,
    double? windSpeed,
  }) {
    return Weather(
      cityName: cityName ?? this.cityName,
      temperatureCelsius: temperatureCelsius ?? this.temperatureCelsius,
      description: description ?? this.description,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cityName': cityName,
      'temperatureCelsius': temperatureCelsius,
      'description': description,
      'humidity': humidity,
      'windSpeed': windSpeed,
    };
  }

  factory Weather.fromOpenWeatherMapJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weatherList = json['weather'] as List<dynamic>;
    final wind = json['wind'] as Map<String, dynamic>;

    final weatherDescription = weatherList.isNotEmpty
        ? (weatherList.first as Map<String, dynamic>)['description'] as String
        : '';

    final tempKelvin = (main['temp'] as num).toDouble();
    final tempCelsius = tempKelvin - 273.15;

    return Weather(
      cityName: json['name'] as String? ?? '',
      temperatureCelsius: tempCelsius,
      description: weatherDescription,
      humidity: (main['humidity'] as num).toInt(),
      windSpeed: (wind['speed'] as num).toDouble(),
    );
  }
}
