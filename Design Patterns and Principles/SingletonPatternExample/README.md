# Exercise 1 - Singleton Pattern

## Objective

Implement the Singleton Design Pattern to ensure that only one instance of a class is created and provide a global point of access to that instance.

---

## Scenario

A logging utility is required for an application. Since only one logger should exist throughout the application's lifecycle, the Singleton Design Pattern is used.

---

## Design Pattern Used

**Singleton Pattern (Creational Design Pattern)**

The Singleton Pattern restricts the instantiation of a class to a single object and provides a global access point to that object.

---

## How It Works

- `Logger` has a private constructor to prevent object creation from outside the class.
- A private static instance of `Logger` is maintained.
- The `getInstance()` method returns the same object every time it is called.
- The `Main` class verifies that only one instance is created.

---

## Expected Output

```
Logger initialized.
Logger instance is working.
Both logger objects are the same instance.
```

---

## Advantages

- Ensures only one instance of a class exists.
- Saves memory by avoiding multiple object creation.
- Provides a single global access point.
- Commonly used for logging, configuration, and database connection management.

---

## Applications

- Logging Frameworks
- Configuration Managers
- Cache Managers
- Database Connection Pools

---

## Output Screenshot

![Program Output](singletonoutput.png)


