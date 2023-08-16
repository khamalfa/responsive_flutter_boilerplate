# Project Desc

A Responsive Flutter Example Project Starter , BoilerPlate.

## Getting Started

- flutter pub get
- flutter run

## Features

- [x] Feature Responsive Content: Responsive for Main Content (List) and Side Content(Container).
- [x] Feature Semi Dynamic Data: add or edit data content in lib/constants/data_dummy_content.dart.
- [ ] Feature Responsive Topbar: Responsive feature for buttons in Topbar and Navigation.

## Tutorial

- Change row per screensize : go to lib/pages/home/hom_content.dart : line 45

```
crossAxisCount:
    context.layout.value(
        xs: 1, // one row if screen is xs
        sm: 1,
        md: 2,
        lg: 2,
        xl: 2, // two row if screen is xl
    ),
```

- Change color code in lib/constants/colors.dart
- Change class data in lib/model

## To-Do List

- [ ] Task 1: Global State Management (Provider/GetX).
- [ ] Task 2: UI - add dialog popup for content detail.
- [ ] Task 3: Chart implementation.

## Screenshot

### Mobile (xs,sm) & Tablet (md,lg)

<img src="https://raw.githubusercontent.com/khamalfa/responsive_flutter_boilerplate/main/ss/01mobile.png" width="250">
<img src="https://raw.githubusercontent.com/khamalfa/responsive_flutter_boilerplate/main/ss/02tablet.png" height="400">

### Website (xl)

<img src="https://raw.githubusercontent.com/khamalfa/responsive_flutter_boilerplate/main/ss/03website.png">

### Hamburger & buttoTriggers

<img src="https://raw.githubusercontent.com/khamalfa/responsive_flutter_boilerplate/main/ss/05hamburger.png" height="300">

<img src="https://raw.githubusercontent.com/khamalfa/responsive_flutter_boilerplate/main/ss/06buttontrigger.png">
