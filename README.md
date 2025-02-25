# Flutter Pokedex: A Pokemon Catalogue

This Flutter application serves as a digital encyclopedia that allows users to explore a collection of Pokemon and view comprehensive information about each creature.

## Features

1. Browse a gallery of Pokemon with seamless pagination.
2. Explore detailed profiles of each Pokemon, including its designation, visual representation, elemental types, special powers, and characteristic metrics.
3. Navigate between Pokemon profiles using intuitive forward and backward controls.
4. Streamlined code implementation utilizing the Bloc state management architecture.
5. Structured according to CLEAN architecture principles for optimal organization.

## Getting Started

To launch this project, follow these instructions:

1. Clone this repository to your workstation.
2. Open the project in your code environment of choice.
3. Execute `flutter pub get` to retrieve all dependencies.
4. Deploy the application on an emulator or physical device with `flutter run`.

## Folder Structure

The project is organized according to this folder hierarchy:

- `lib`
    - `bloc`: Contains exclusively the blocs for the Pokemon listing and individual Pokemon details.
    - `components`: Houses reusable interface elements.
    - `const`: Stores constant values referenced throughout the application.
    - `extensions`: Contains extension methods for core Dart types.
    - `models`: Holds data structures utilized within the application.
    - `pages`: Contains the visual screens/interfaces of the application.
    - `routes`: Manages navigation pathways and routing logic.
    - `services`: Handles business logic and external API communications.
    - `style`: Contains design assets and visual themes for consistent presentation.
  
- `test`: Incorporates unit tests implemented with the bloc_test library.
