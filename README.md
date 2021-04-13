# flutter_template

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
HOW TO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

- Create a stateless screen

1. Inherit from "BaseStatelessScreen"
2. Override "buildScreenContents()" to return screen contents
3. Optionally override getScreenTitle() to return title displayed on app bar (or "" if no app bar wanted)
Ex: SplashScreen

- Create a stateful screen

1. Inherit from "BaseStatefulScreen"
2. Override "buildScreenContents()" to return widget contents
3. Optionally override getScreenTitle() to return title displayed on app bar (or "" if no app bar wanted)

- Create a stateless widget

1. Inherit from "BaseStatelessWidget"
2. Override "buildWidgetContents()" to return widget contents
Ex: LoadingWidget

- Create a stateful widget

1. Inherit from "BaseStatefulWidget"
2. Override "buildWidgetContents()" to return widget contents

- Create a stateful widget with bloc

1. Inherit from "BaseStatefulWidgetWithBloc"
2. Override buildWidgetContent() to return widget contents
Ex: LoginButtonWidget