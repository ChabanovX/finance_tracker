# Finance Tracker

Finance Tracker is a Flutter application for managing personal income and expenses. It was built as a sample project using Riverpod for state management and ObjectBox as a local database.

## Features

- Record expenses and income with custom categories.
- View today's transactions and edit or delete them.
- Track transaction history with date range filters and sorting.
- Analyze spending with an animated pie chart grouped by categories.
- Maintain account balance and visualize it using charts.
- Browse helpful finance articles with fuzzy search.
- Works completely offline using ObjectBox and seeded mock data.

## Getting Started

1. Install [Flutter](https://flutter.dev/docs/get-started/install) (version 3.7 or newer).
2. Fetch the dependencies:

   ```bash
   flutter pub get
   ```

3. Generate the necessary files (freezed, JSON serialization and ObjectBox bindings):

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. Run the application on a device or emulator:

   ```bash
   flutter run
   ```

The project contains a small local package in `packages/animated_pie_chart` providing the animated chart used on the analysis screen.

## Project Structure (deprecated)

```
lib/
  data/       # Repositories and local ObjectBox data sources
  domain/     # Domain models and repository interfaces
  presentation/  # UI widgets and Riverpod providers
  util/       # Helpers such as navigation and logging
packages/animated_pie_chart  # Local chart package
```

Mock data for categories, articles and transactions can be found in `lib/data/datasources/mock_data.dart` and is inserted when the database is first created.

## License

This project is provided for educational purposes and does not include any production-ready financial advice.
