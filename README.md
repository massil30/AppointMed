# 🏥 AppointMed

**A comprehensive Flutter application for managing medical appointments with doctors.**

AppointMed allows users to browse doctors, schedule appointments, manage favorites, and handle payments seamlessly across multiple platforms with responsive design.

## 📱 Screenshots
Clone Ui https://www.figma.com/design/2l2BSiGAfFSttceZ85OahL/Medical-Health-Mobile-App-Dermatology-App-Ui-Kit-Doctor-Mobile-App--Community-?node-id=21-455&t=nDSd7j3qa53S9lb1-0
*Coming soon - Screenshots of the app in action*

## ✨ Features

### 🔐 Authentication
- **Login/Signup** - Secure user authentication
- **Social Login** - Google/Facebook integration
- **Password Recovery** - Forgot password functionality

### 👨‍⚕️ Doctor Management
- **Browse Doctors** - View available doctors by specialty
- **Doctor Details** - Detailed doctor profiles with ratings and reviews
- **Search & Filter** - Find doctors by name, specialty, or location
- **Favorite Doctors** - Save preferred doctors for quick access

### 📅 Appointment System
- **Schedule Appointments** - Book appointments with available doctors
- **Appointment History** - View past, upcoming, and cancelled appointments
- **Appointment Management** - Cancel or reschedule appointments
- **Calendar Integration** - Visual appointment scheduling

### 💬 Communication
- **In-App Chat** - Direct messaging with doctors
- **Chat History** - Persistent conversation storage
- **Notification System** - Real-time appointment and chat notifications

### 💳 Payment Integration
- **Multiple Payment Methods** - Credit cards, digital wallets
- **Secure Payment Processing** - Encrypted payment handling
- **Payment History** - Track all payment transactions
- **Receipt Generation** - Digital payment receipts

### 👤 User Profile
- **Profile Management** - Edit personal information
- **Settings** - App preferences and configurations
- **Help Center** - Support and FAQ section
- **Privacy Policy** - Data protection information

### 🌙 Advanced Features
- **Dark Mode** - Toggle between light and dark themes
- **Multi-language Support** - English and French localization
- **Responsive Design** - Optimized for phones, tablets, and desktops
- **Offline Support** - Basic functionality without internet
- **Device Preview** - Test on different device sizes during development

## 🏗️ Technical Architecture

### State Management
- **BLoC Pattern** - Business Logic Component for state management
- **Cubit** - Lightweight state management for simple use cases
- **Hydrated BLoC** - Persistent state storage

### Navigation
- **Go Router** - Declarative routing with type-safe navigation
- **Named Routes** - Organized route management

### Responsive Design
- **ScreenUtil** - Responsive sizing across different screen sizes
- **Responsive Framework** - Adaptive layouts for various devices
- **Media Queries** - Dynamic UI adjustments based on screen size

## 📦 Dependencies

### Core Dependencies
```yaml
# State Management
flutter_bloc: ^8.1.6
hydrated_bloc: ^9.1.5
equatable: ^2.0.7

# Navigation
go_router: ^16.2.4

# Responsive Design
flutter_screenutil: ^5.9.3
responsive_framework: ^1.5.1



# UI Components
cached_network_image: ^3.4.1
google_fonts: ^6.3.2

# Utilities
connectivity_plus: ^7.0.0
fluttertoast: ^9.0.0

# Development
device_preview: ^1.3.1
```

### Feature-Specific Dependencies
```yaml
# Chat System
chat_package: ^2.0.1

# Payment Processing
u_credit_card: ^1.4.0

# Ratings & Reviews
flutter_rating: ^2.0.2


```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/appointmed.git
   cd appointmed
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate native splash screen**
   ```bash
   flutter pub run flutter_native_splash:create
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Development Setup

1. **Enable device preview** (for development)
   ```dart
   // In main.dart
   DevicePreview(enabled: true) // Set to false in production
   ```

2. **Configure design size**
   ```dart
   // In main.dart - ScreenUtilInit
   designSize: const Size(360, 690)
   ```

## 📁 Project Structure

```
lib/
├── 📁 components/              # Reusable UI components
│   ├── appbar.dart            # Custom app bar
│   ├── buttons.dart           # Button variants
│   ├── dialogs.dart           # Modal dialogs
│   ├── searchfield.dart       # Search input field
│   ├── textfield.dart         # Custom text fields
│   └── toast.dart             # Toast notifications
│
├── 📁 config/                 # App configuration
│   ├── connectivity.dart      # Network connectivity
│   ├── dependencies.dart      # Dependency injection
│   ├── theme.dart             # App theming
│   ├── urls.dart              # API endpoints
│   ├── 📁 language/           # Internationalization
│   │   ├── language_cubit.dart
│   │   ├── translation.dart
│   │   └── shared_pref_language.dart
│   └── 📁 routes/             # Navigation routes
│       ├── routes.dart
│       └── routesName.dart
│
├── 📁 features/               # Feature-based modules
│   ├── 📁 auth/               # Authentication
│   │   ├── login.dart
│   │   ├── signup.dart
│   │   └── auth_widget.dart
│   │
│   ├── 📁 appointment/        # Appointment management
│   │   ├── appointement.dart
│   │   ├── appointment_cards.dart
│   │   ├── cancelappointement.dart
│   │   ├── reviewappoi.dart
│   │   ├── data_appoin.dart
│   │   └── 📁 appoin_widget/
│   │       └── tab_button.dart
│   │
│   ├── 📁 doctors/            # Doctor management
│   │   ├── doctors.dart
│   │   ├── doctor_details_page.dart
│   │   └── doctor_component.dart
│   │
│   ├── 📁 favorite/           # Favorite doctors
│   │   ├── favorites_page.dart
│   │   ├── favorit_widget.dart
│   │   ├── doctor_model.dart
│   │   └── 📁 bloc/
│   │       ├── favorite_bloc.dart
│   │       ├── favorit_event.dart
│   │       └── favorit_state.dart
│   │
│   ├── 📁 chat/               # Messaging system
│   │   ├── chatPage.dart
│   │   └── chat_people.dart
│   │
│   ├── 📁 notification/       # Push notifications
│   │   ├── notification.dart
│   │   └── notification_widget.dart
│   │
│   ├── 📁 payment/            # Payment processing
│   │   ├── paymentCard.dart
│   │   ├── paymentMethode.dart
│   │   ├── reviewPayment.dart
│   │   ├── sucessPayment.dart
│   │   └── 📁 review_card/
│   │       ├── review_C.dart
│   │       └── review_widget.dart
│   │
│   ├── 📁 profile/            # User profile
│   │   ├── profile.dart
│   │   ├── editprofile.dart
│   │   └── 📁 profile_components/
│   │       └── logout.dart
│   │
│   └── 📁 schedule/           # Scheduling system
│       ├── schedule.dart
│       ├── schedule_widget.dart
│       └── shedule_data.dart
│
├── 📁 pages/                  # Main application pages
│   ├── bottom_navigation_bar.dart
│   ├── splashscreen.dart
│   ├── welcomPage.dart
│   ├── privacy_policy.dart
│   ├── 📁 homepage/
│   │   ├── homepage.dart
│   │   └── 📁 home_widget/
│   │       ├── daily_list.dart
│   │       ├── doctor_card.dart
│   │       ├── home_appbar.dart
│   │       └── shcedule_card.dart
│   └── 📁 helpCenter/
│       ├── help_center.dart
│       └── 📁 widgets/
│           └── toggleC.dart
│
├── 📁 utils/                  # Utility functions
│   ├── common.dart            # Common utilities
│   ├── responsivity.dart      # Responsive helpers
│   ├── theme_extention.dart   # Theme extensions
│   ├── network_image_widget.dart
│   └── nums.dart              # Numeric constants
│
├── main.dart                  # App entry point
└── test.dart                  # Widget tests
```

## 🎨 Design System

### Color Palette
- **Primary**: Blue (#2260FF)
- **Secondary**: Light Blue (#E3F2FD)
- **Background**: Light (#FBFBFE) / Dark (#121212)
- **Success**: Green
- **Error**: Red

### Typography
- **Font Family**: League Spartan (Google Fonts)
- **Responsive Text**: Using ScreenUtil (.sp)

### Components
- **Custom Buttons**: Primary, Secondary, Icon variants
- **Cards**: Doctor cards, Appointment cards
- **Dialogs**: Loading, Success, Error, Confirmation
- **Forms**: Text fields with validation

## 🔧 Development Guidelines

### Code Style
- Follow Dart/Flutter linting rules
- Use meaningful variable and function names
- Implement proper error handling
- Add comments for complex logic

### Responsive Design
- Use ScreenUtil for sizing (.w, .h, .sp, .r)
- Test on multiple screen sizes
- Implement adaptive layouts

### State Management
- Use BLoC for complex state
- Use Cubit for simple state


## 📱 Platform Support

- ✅ **Android** (API 21+)




## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.




**Made with ❤️ using Flutter**