# mytasks

MyTasks is a kanban board for tasks, where users can create, edit, and move tasks between different columns (e.g. "To Do", "In Progress", "Done").

## Getting Started

This project is using MVVM structure and the latest techniques for Flutter best practices and clean code.

## Features

1. A kanban board for tasks, where users can create, edit, and move tasks between different columns (e.g. "To Do", "In Progress", "Done"). 
2. A timer function that allows users to start and stop tracking the time spent on each task. 
3. A history of completed tasks, including the time spent on each task and the date it was completed. 
4. Users are able to comment on each task. 
5. Customizable themes: Users allowed to customize the look and feel of the app by choosing from a selection of pre-defined color schemes. 
6. Offline functionality: The app is allowed to work offline to show the history activities. 
7. Multi-language support: The app is supported for different languages (English,German), this will make the app more accessible to a global audience.

## Structure

First of all the app is using Mvvm Structure which is (model, view, viewModel) and Repository Pattern
which separate the project to layers (Ui layer, Presentation layer, Data layer).

1. Ui layer in the app is ui folder which has all the screens and the widgets ordered and separated carefully
 to screens and widgets : appbars, buttons, dialogs, List items and so on.

2. Presentation layer it comes in the middle between Ui layer and Data layer, and every communication is
 between the other mentioned layers is done by it.
 Presentation layer is the ViewModel which is in our case are the Controllers, where the business logic
 is done there (I added each controller in the same folder of its screen).

3. Data layer: Is in our case the Repository where we inject the LocaldDta and RemoteData sources instances in
 it.
 *. *Remote Data Source*: Where we inject all the instances for remote communications protocols such as http, graphQl..
   In our case we have two api clients (http, dio).
 *. *Local Data Source*: Where we inject all the instances for local data such as (SharedPreferences, Sqlite). 
 *. We have also model folder which has all the the App's model classes.

5. Dependency Injection: We have di folder where we declare all the App dependencies to inject them later where we
 need them.

6. App Configuration: We have configs folder where we have (Navigation Routes, Theme, Colors, Dimens).


## To Do Features

1. Background Services: 
 I will use Work Manager package to organize and schedule the InProgress tasks in background and let them
 working in the background when the app is terminated.
2. Analytics: Implement analytics to track how users are using the app and identify areas for improvement.
3. Notifications: Add push notifications to remind users of upcoming tasks
   
 A few links to reach me out:

- [Bahsar Kousa Linkedin](https://www.linkedin.com/in/bashar-kousa-0b471a191/)
- [Bahsar Kousa Portfolio](https://bashar-kousa.web.app/Portfolio)


