# Code Challenge 2

Following the requirements listed below, build an app that allows a user to:

1. View a list of cities and states (or provinces) in a table view

  Requirement: Create a custom class named City with the necessary properties to hold the city‘s name and state (or province). Requirement: Programmatically create at least 4 of your favorite cities using the custom City class.

2. Be able to delete cities and states (or provinces) from the list

3. Be able to show a detail view of a selected city from the list. Allow viewing and editing of city name, state/province.

  Requirement: Build the UI in such a way that when a user taps on a city in the list, it pushes to the city detail view controller.

4. Be able to view the wikipedia site for the selected city from the city detail view controller. 

  Requirement: Use a label to modally present the wikipedia site, not a UIButton. 
  
  Requirement: User must be able to dismiss the modally presented view.

5. Give your City class a UIImage property. Programmatically assign each of your City objects with a unique image. Display each city’s image in the city detail view controller.

6. Show the image alongside the city name in the cities list.

7. Add a button to your DetailViewController. When this button is tapped, the title of your RootViewController (the one with the list of cities) will change to whatever city’s details you are currently viewing.

  Requirement: Use Custom Delegation to communicate back to the RootViewController from your DetailViewController
