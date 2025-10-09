# E-Commerce Flutter Application

A modern e-commerce mobile application built with Flutter, featuring a clean architecture, BLoC state management, and a polished UI.

## 📱 Features Implemented

### 1. **Authentication**
- User login with email and password
- Secure token storage
- Persistent login sessions

### 2. **Home Screen**
- Display product categories
- Product grid with images, names, and prices
- Category filtering
- Search functionality
- Cart icon navigation

### 3. **Product Details**
- Detailed product information
- Product images
- Price display
- Size selection
- Product description
- Reviews section
- Add to cart functionality with loading state
- Success/error feedback via snackbars

### 4. **Shopping Cart**
- View cart items with product details
- Quantity display for each item
- Price breakdown (base price, discount, final price)
- Delivery address section
- Payment method section
- Order summary (subtotal, shipping, total)
- Checkout button
- Navigation from home and product details

### 5. **Order Confirmation**
- Order confirmed screen with success illustration
- "Go to Orders" button (placeholder)
- "Continue Shopping" button (returns to home)

## 🏗️ Architecture

- **Clean Architecture** with separation of concerns
- **Feature-First** project structure
- **BLoC/Cubit** for state management
- **GetIt** for dependency injection
- **Freezed** for immutable state classes
- **Retrofit + Dio** for API communication

## 🔌 API Endpoints Used

### Authentication
- `POST /auth/login` - User login

### Products
- `GET /products` - Fetch all products
- `GET /products/{id}` - Fetch product details
- `GET /categories` - Fetch product categories

### Cart
- `GET /cart` - Fetch user's cart
- `POST /cart/items` - Add item to cart

## 🚀 How to Run the App

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK
- Android Studio / Xcode (for iOS)
- A physical device or emulator

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd ecommerce_assignment3
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for models, API services, and state classes)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

### Additional Commands

- **Run tests**
  ```bash
  flutter test
  ```

- **Analyze code**
  ```bash
  flutter analyze
  ```

- **Build APK (Android)**
  ```bash
  flutter build apk --release
  ```

- **Build iOS**
  ```bash
  flutter build ios --release
  ```

## 📦 Key Dependencies

- `flutter_bloc` - State management
- `get_it` - Dependency injection
- `dio` - HTTP client
- `retrofit` - Type-safe API client
- `freezed` - Code generation for models/unions/pattern matching
- `json_serializable` - JSON serialization
- `flutter_screenutil` - Responsive UI
- `cached_network_image` - Image caching
- `flutter_secure_storage` - Secure token storage
- `shimmer` - Loading placeholders

## 🎨 UI Features

- Responsive design using ScreenUtil (375x812 design size)
- Custom reusable widgets (AppTextButton, AppTextFormField, AppSnackbar)
- Smooth navigation with named routes
- Loading states with shimmer effects
- Error handling with user-friendly dialogs
- Bottom navigation bar
- Product image caching for better performance

## 📂 Project Structure

```
lib/
├── core/
│   ├── di/                    # Dependency injection
│   ├── helpers/               # Extensions, constants, utilities
│   ├── networking/            # API client, error handling
│   ├── routing/               # App router and routes
│   ├── theming/               # Colors, text styles
│   └── widgets/               # Reusable widgets
├── features/
│   ├── cart/                  # Shopping cart feature
│   ├── home/                  # Home screen feature
│   ├── login/                 # Authentication feature
│   ├── onboarding/            # Onboarding feature
│   ├── order_confirmed/       # Order confirmation feature
│   └── product_details/       # Product details feature
└── main.dart
```

Each feature follows clean architecture:
```
feature_name/
├── data/
│   ├── apis/                  # API service definitions
│   ├── models/                # Data models
│   └── repos/                 # Repository implementations
├── domain/
│   └── repos/                 # Abstract repository interfaces
└── presentation/
    ├── cubit/                 # State management
    └── ui/                    # Screens and widgets
```

## 🔐 Security

- Secure token storage using flutter_secure_storage
- Password fields with visibility toggle
- API error handling with meaningful messages

## 📝 Notes

- The app uses a design size of 375x812 for responsive layouts
- All API calls include error handling and loading states
- The app follows Material Design principles
- Cart and product details screens have cart icon navigation
- Add to cart shows loading on the button without screen flicker
- Success/error messages are displayed via snackbars

## 👨‍💻 Development

To modify the app:

1. Add new features following the existing feature-first architecture
2. Register dependencies in `core/di/dependency_injection.dart`
3. Add routes in `core/routing/routes.dart` and `core/routing/app_router.dart`
4. Run build_runner after modifying generated code files
5. Follow the existing patterns for state management and UI composition
