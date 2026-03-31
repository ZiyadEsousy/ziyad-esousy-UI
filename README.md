# ziyad-esousy-UI
Midterm project submission by Ziyad Esousy

Project Title

**Food Picker App**

## How To Run

Navigate the to the FOOD_APP file, then lib, then main. open the terminal and run "flutter run -d web-server". Take the host id and paste it in your desired browser.

## Research Problem

Many people struggle with deciding what to eat, especially when faced with multiple options. This often leads to indecision, wasted time, or repeatedly choosing the same meals. The problem addressed in this project is how to simplify the decision-making process by providing a quick, random, and visually engaging way to select food based on user preferences.

---

## Motivation

This project is important because decision fatigue is a common everyday issue. By creating a simple and interactive application, users can quickly choose meals without overthinking. The app also enhances user experience by:

* Providing categorized food options (e.g., Sweet, Savoury, Healthy, Vegan)
* Using visuals (images) to make choices more appealing
* Keeping a history of selections for reference

The goal is to make food selection fun, fast, and stress-free.

## Control Flow

### Step-by-step process:

1. The application starts and loads the main interface.
2. The user is presented with food categories as buttons.
3. The user selects a category.
4. The app retrieves the list of foods in that category.
5. A random food item is selected using a random number generator.
6. The selected food is displayed with its image and name.
7. The selected food is added to the history list.
8. The user can continue selecting categories to generate new results.

## Implementation Strategy

### Code Structure:

* **Main Entry (`main.dart`)**

  * Starts the application using `runApp()`

* **Food Class**

  * Represents a food item
  * Contains:

    * `name` (String)
    * `image` (String URL)

* **MyApp (Stateless Widget)**

  * Root of the application
  * Sets up the main theme and home screen

* **FoodPicker (Stateful Widget)**

  * Core of the application logic
  * Manages:

    * Selected food
    * History list
    * Food categories

### Key Components:

* **Data Storage**

  * A `Map<String, List<Food>>` is used to store food categories and their items

* **Random Selection Logic**

  * Uses `Random()` to pick a food item from a selected category

* **State Management**

  * `setState()` updates:

    * The currently selected food
    * The history list

* **User Interface**

  * Built using Flutter widgets such as:

    * `Scaffold`
    * `AppBar`
    * `Column`
    * `Wrap` (for category buttons)
    * `ListView` (for history display)
  * Images are loaded using `Image.network`

### Application Logic Summary:

* User input (button press) triggers `pickFood()`
* A random item is selected from the chosen category
* The UI updates dynamically to reflect the new selection
* Previous selections are stored and displayed in a scrollable history list

