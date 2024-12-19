# nooro-weatherApp
Create a weather app with MVVM clean architecture, combine, swiftUI and testability.

# Weather App

## Description

A SwiftUI app that provides weather data using the WeatherApi.com.

## Features

- Search for weather information by city name.
- Display current weather conditions.
- Save city weather data on tap to save.
- Show saved city weather data between app launch.

## Design

- Clean Architecture MVVM design to separate UI and logic.
- Combine is used for reactive programming
- App UI is developed with latest SWiftUI framework.
- Protocol Oriented Programming & Dependency Injection are implemented for better testability.
- Separation of concern with components and views.
- Repository layer for data sources both local and remote.
- Use case layer to separate business logic.

## Testibility

- Unit testing for some layers has been added to get idea.
- The architecture fully supports 100% unit test.
- Mocks & Spies are properly created in Mocker folder
- For seed data Weather Fixtures are used.

## Setup

1. **Clone the repository**:

   - git clone https://github.com/smyawar01/nooro-weatherApp
   - Open the project in xcode
   - Press the Run/Play button

## Important
- This project is created and developed on Xcode 16.2 and ran on iOS 18.2 iPhone pro simulator.
- App configs like API key, urls etc are maintained using AppConfigs.
- And configs are pushed to git repo for convenience only and is a bad practice for security reason.

## TODOs
- Need to add Snapshot testing but due to time limit was not added although current architecure supports Snapshot testing
- Just need to mock ViewModels and based on state change View Rendering can be snapshot.
- e2e testing using XCUITest is still not implemented due to time constraint.
