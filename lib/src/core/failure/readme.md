# Failure Handling in Your Flutter App
In this app, error or failure handling is centralized using the **AppFailure** class, which is extended by specific failure types like **NetworkFailure** and **LocalFailure**. This approach allows you to represent different kinds of errors consistently across your app, providing a flexible, reusable, and maintainable system for dealing with failures.

<u>**We'll explore:**</u>

How AppFailure is implemented via NetworkFailure and LocalFailure.
Why this approach is beneficial.
What principles (like SOLID) are maintained by this approach.


## 1. How AppFailure is Implemented via NetworkFailure and LocalFailure
This app's Failure Handling system starts with an abstract class called **AppFailure**, which acts as a base class for all types of errors this app might encounter.

### AppFailure Class (Base Class)
```dart
abstract class AppFailure {
  final String message;
  
  AppFailure(this.message);

  @override
  String toString() => message;
}
```

**<u>Purpose:</u>** AppFailure is an abstract class that represents a generic error in the app. It contains a single property, message, which holds the error message. By using an abstract class, you establish a contract that all specific failure types (e.g., NetworkFailure, LocalFailure) must adhere to, ensuring consistency.

### NetworkFailure Class
```dart
class NetworkFailure implements AppFailure {
  final int? statusCode;

  NetworkFailure(String message, {this.statusCode}) : super(message);
}
```
**<u>Purpose:</u>** NetworkFailure extends AppFailure and adds specific details about network-related errors. It includes an optional statusCode field to capture HTTP response codes (e.g., 404, 500) when an error occurs during an API call.

**<u>Use Case:</u>** When a network request fails, such as a timeout or an invalid response from the server, NetworkFailure is used to represent that error.

### LocalFailure Class
```dart
class LocalFailure implements AppFailure {
  LocalFailure(String message) : super(message);
}
```
<u>**Purpose:**</u>LocalFailure represents errors that occur locally in the app, such as database issues, file read/write errors, or any other failures unrelated to network communication.

<u>**Use Case:**</u> If there’s a problem with storing data on the device or a failure in local processing, you can use LocalFailure to capture and handle it accordingly.

### Example of Mapping Exceptions to Failures
In your repository, when you catch an exception, you map it to a failure type based on the nature of the error. Here's an example:

```dart
try {
  final response = await apiService.fetchData();
  return Right(response);
} catch (e) {
  if (e is DioError) {
    // Network error case
    return Left(FailureMapper.getFailures(e));
  } else {
    // Local error case
    return Left(LocalFailure("An unexpected error occurred locally."));
  }
}
```
The FailureMapper utility converts different exceptions (e.g., DioError) into their appropriate failure types (e.g., NetworkFailure).

## 2. Why This Approach is Beneficial
This failure-handling strategy provides several key benefits:

- <u>**A. Consistent and Centralized Error Handling**</u>

By using a centralized system with AppFailure, NetworkFailure, and LocalFailure, you ensure that errors are treated uniformly across the app. Instead of handling different error types in every repository or notifier, you can handle errors in a unified way, simplifying your codebase.

For example, regardless of whether the error came from a network call or a local database failure, your UI can handle it in a consistent manner:

```dart
state.fold(
  (failure) => showErrorDialog(failure.message), // Unified error handling
  (data) => showDataOnUI(data),
);
```

- <u>**B. Easier Error Mapping and Debugging**</u>

Because each failure type is clearly defined (network errors vs. local errors), it becomes easier to debug issues. For example, NetworkFailure can contain additional details like status codes or specific messages from the server, making it easier to pinpoint the cause of the error.

In your logs, you might see:

```go
Network error: Status code 404 - Resource not found
```
versus:

```lua
Local error: Database read failure
```
- <u>**C. Extensibility**</u>

If you need to add more specific failure types in the future (e.g., *AuthenticationFailure*, *TimeoutFailure*), this architecture is easily extendable. Simply create a new class that extends AppFailure.

```dart
class AuthenticationFailure extends AppFailure {
  AuthenticationFailure(String message) : super(message);
}
```
This makes your app more flexible as it grows in complexity.

- **<u>D. Reusability</u>>**

With this structure, failure handling can be reused across different parts of your app. Any time you encounter a network or local error, you can use the same set of failure types without rewriting error handling logic for every feature.

- **<u>E. Separation of Concerns</u>**

Repositories focus solely on fetching data.
Failure Handling is delegated to specific classes that represent different types of errors, maintaining clear boundaries between data fetching and error handling.

## 3. Principles Maintained by This Approach
This failure-handling system adheres to several core principles of software design, especially those from the SOLID principles:

- **A. Single Responsibility Principle (SRP)**
Each class has one responsibility:

AppFailure is responsible for representing a failure.
NetworkFailure is responsible for representing network-related failures.
LocalFailure is responsible for local failures.
This makes your code more readable, maintainable, and easier to debug since each class has a focused purpose.

- **B. Open-Closed Principle (OCP)**
The system is open for extension but closed for modification. If you need to introduce a new failure type in the future (e.g., DatabaseFailure, PermissionFailure), you can extend AppFailure without changing the existing classes:

dart
Copy code
class PermissionFailure extends AppFailure {
  PermissionFailure(String message) : super(message);
}
This prevents you from modifying existing, tested code while still allowing the system to grow.

- **C. Liskov Substitution Principle (LSP)**
Derived classes (NetworkFailure, LocalFailure, etc.) can be substituted for their base class (AppFailure). This ensures that any place expecting an AppFailure can handle all types of failures interchangeably.

    For example:

    ```dart
    void handleFailure(AppFailure failure) {
    print(failure.message); // Works regardless of the specific failure type.
    }
    ```
- **D. Dependency Inversion Principle (DIP)**
High-level modules (like notifiers) depend on abstractions (AppFailure) rather than on low-level implementations (specific failure types). This allows the high-level business logic to remain decoupled from how failures are handled.

- **E. Encapsulation and Abstraction**
The details of network or local failures are encapsulated within their respective classes, hiding complexity from the rest of the app. The rest of the app simply deals with AppFailure, unaware of whether it's a network or local error, making the error handling mechanism abstract and easy to manage.

## Conclusion: Why This Approach is Ideal for Your App
The failure-handling system you're using with AppFailure as a base class for NetworkFailure, LocalFailure, and potentially other failure types in the future is an excellent design choice. It ensures that:

- Errors are consistently handled across the app, reducing redundancy and making the code more maintainable.
- Debugging is easier due to specific failure types that provide detailed error information.
- The system is flexible and can grow as the app becomes more complex.
SOLID principles like Single Responsibility, Open-Closed, and Liskov Substitution are maintained, ensuring a clean, scalable architecture.
- This robust failure-handling system allows your app to gracefully manage different types of errors, providing a better user experience and making the codebase easier to understand and maintain for developers at all levels.

