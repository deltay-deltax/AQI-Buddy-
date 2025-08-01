# AQI Buddy 🏞️

**AQI Buddy** is a Flutter mobile application that fetches real-time Air Quality Index (AQI) data based on the user's current geolocation. It provides a clean and informative UI to help users understand air quality and take precautions accordingly.

## 🛠️ Features

- 🌍 Gets user's current location using Geolocator
- 📍 Displays city name using Geocoding
- 📊 Fetches AQI data from OpenWeatherMap Air Pollution API
- 🎨 Dynamic UI with AQI categories and health tips
- 📈 Trends page and Story mode (placeholder for expansion)
- ⚙️ Settings page

## 🧱 Tech Stack

- Flutter
- Dart
- [Geolocator](https://pub.dev/packages/geolocator)
- [Geocoding](https://pub.dev/packages/geocoding)
- [Dio](https://pub.dev/packages/dio)
- OpenWeatherMap API

## 🧪 How to Run

### 1. Clone the repository

```bash
git clone https://github.com/deltay-deltax/AQI-Buddy.git
cd AQI-Buddy
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Setup Permissions

**Android:** Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
```

### 4. Add your API key

In `aqidata.dart`, replace:

```dart
final String apikey = 'your_openweathermap_key';
```

### 5. Run the app

```bash
flutter run
```

## 📸 Screenshots

![WhatsApp Image 2025-08-01 at 21 21 27_e9c2e4cc](https://github.com/user-attachments/assets/840c53b4-f483-4864-a8d4-11b953b00858)

![WhatsApp Image 2025-08-01 at 21 21 27_79cabb40](https://github.com/user-attachments/assets/c6b09f44-aecd-4c6d-bfd5-e6e760598dec)



## 📦 Folder Structure

```
lib/
├── AQI_Service/
│   ├── aqidata.dart
│   └── geolocation.dart
├── models/
│   └── Aqitip.dart
├── pages/
│   ├── bottomnav.dart
│   ├── home.dart
│   ├── trendspage.dart
│   ├── storymode.dart
│   └── settingpage.dart
└── main.dart
```

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

© 2025 Aaditya Gupta | [GitHub](https://github.com/deltay-deltax)

## 🧠 Upcoming Features

- 🤖 Integration of AI to provide smarter health tips and pollution forecasts based on AQI patterns
- 📍 Intelligent location-based alerts and suggestions
- 🗣️ Voice assistant support for hands-free AQI queries

Stay tuned for the next version with AI capabilities!
