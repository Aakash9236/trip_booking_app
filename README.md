# Trips & Bookings App

This is a small Flutter app created for the Flutter Developer Test.

The app has 3 screens:

- Login Screen
- Trips List Screen
- Trip Details Screen

## What it does

### Login

- Email validation
- Password validation (minimum 6 characters)
- No real authentication is used

### Trips List

- Shows trips from the provided mock data
- Search trips by title
- Displays trip title, date and current status

### Trip Details

- Shows all trip information
- Status can be updated from the details screen
- Changes are reflected immediately on the trips list screen

## State Management

GetX is used for state management.

## Packages Used

- get

## Run the project

Install packages:

flutter pub get

Run the app:

flutter run

## Build APK

flutter build apk --release

## Notes

- Mock JSON data is used.
- No API integration.
- No local database/storage.
- Status updates are handled using GetX state management.

## Author

- Aakash Kumar Gupta

Thanks for reviewing the project.
