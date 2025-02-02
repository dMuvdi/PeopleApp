# PeopleApp: Technical Project

**PeopleApp** is a projects that consists of creating a mobile application with Flutter in order to list users and the posts they make.

The users and posts are obtained from a Rest type web services that are already built and you only have to consume them.

## Features

* When the application is opened, verify if the users are stored locally, if so, they should only be presented; if they are not stored locally, the Web Service should be consumed, store the result and present them to the user.
* When selecting a user, name, telephone number, e-mail and list of posts must be displayed.
* Users should be filtered by name, each time a letter is typed it should display the users whose name corresponds to the filter.

## Getting Started

### Running the Mobile App

1. **Prerequisites:**
   * Flutter development environment set up ([https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install))
   * A connected device or emulator

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/dMuvdi/PeopleApp.git
   ````

3. **Navigate to the Project Directory:**
   * Use the cd command to navigate to the cloned project directory:
   ```bash
   cd people_app
   ````

4. **Get Dependencies:**
   * Run the following command to fetch the necessary packages:
   ```bash
   flutter pub get
   ````

5. **Open the Project in Your IDE:**
   * Open your chosen IDE (Android Studio or VS Code).
   * Open the cloned project directory.

6. **Run the App:** 
   * Android Studio:
      * Click the "Run" button or press Shift+F10.
      * Select your desired emulator or connected device.
   * VS Code:
      * Open the command palette (Ctrl+Shift+P or Cmd+Shift+P).
      * Type "Flutter: Run" and select.
      * Choose your target device.

## UI Proposal

![UI Proposal](ui_proposal.png)
