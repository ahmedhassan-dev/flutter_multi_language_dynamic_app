# Flutter Multi-Language App with Dynamic Views

This is a **Flutter app** that demonstrates the implementation of a **multi-language app** with **dynamic views**. It includes features like **login/registration**, **localization**, **maps**, and **API integration** with offline support.

---

## **Features**

### **1. Login View**
- **Username and Password Fields**: Input fields for user credentials.
- **User Type Dropdown**: Select between "Admin" and "User".
- **Sign In and Register Buttons**: Log in or navigate to the registration page.
- **Language Toggle Icon**: Switch between **English** and **Arabic** (RTL/LTR support).

### **2. Register View**
- **Full Name, Username, Password, Email, and Phone Fields**: Input fields for user registration.
- **Validation**: Real-time validation for each field (e.g., email format, password strength).

### **3. Main View**
- **Tab 1**: Horizontal and vertical scrolling with static data.
- **Tab 2**: Map with current location and marker.
- **Tab 3**: List of data loaded from an online API (with offline support).
- **Settings Button**: Change app language or log out.

---

## **Packages Used**

| Package               | Description                                      |
|-----------------------|--------------------------------------------------|
| `easy_localization`   | For multi-language support.                     |
| `shared_preferences`  | For local storage (e.g., saving user data).     |
| `go_router`           | For navigation.                                 |
| `flutter_screenutil`  | For responsive UI design.                       |
| `flutter_bloc`        | For state management (Cubit).                   |
| `google_maps_flutter` | For displaying maps.                            |
| `geolocator`          | For getting the user's current location.        |
| `dio`                 | For making API requests.                        |
| `json_serializable`   | For JSON serialization.                         |

---

## **Project Structure**

- **core/**: Contains shared utilities, constants, and configurations used throughout the project.
- **data/**: Handles data fetching, storage, and management.
  - **datasources/**: Manages API requests (remote) and local database/cache interactions.
  - **models/**: Defines data transfer objects (DTOs) and JSON serialization.
  - **repositories/**: Implements the repository pattern to provide data to the domain layer.
- **domain/**: Pure business logic layer.
  - **repositories/**: Abstract repository contracts for data access.
  - **usecases/**: Contains business logic operations.
- **presentation/**: Handles UI and state management.
  - **pages/**: Contains the application's main screens (Login, Register, Home).
  - **widgets/**: Reusable UI components.
  - **manager/**: State management (Cubit).
- **main.dart**: The main entry point of the application.

This structure follows **Clean Architecture** principles, ensuring separation of concerns, testability, and maintainability.

---


## **Generate Localization Files**
dart run easy_localization:generate

## Download Link

[Download APK](https://drive.google.com/file/d/1J3_NtpZredH4jRogGogIGltUmpw_RSX_/view?usp=sharing)
