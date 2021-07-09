# flutter_template

Flutter architecture template.

## Architecture Overview

Project is structured in the following layers/modules:

- Presentation

- Domain

- Data

- Network

PRESENTATION LAYER is Flutter dependent. Defines its own custom hierarchy: screens (
widgets usually used as containers, similar to Android activities) and widgets (pieces of UI with behavior, similar to
Android fragments).

DOMAIN LAYER provides state management through BLoC's for different use cases. Ex: performing a login

DATA LAYER is used to manage and orchestrate different data sources.

NETWORK LAYER performs net connections either directly or indirectly.

Data models are share across all modules, there is no custom data model per layer.

Events (in fact just simple Data Transport Object) are used to define use case inputs in domain layer and provide type safety.

## Code generation commands

flutter packages pub run build_runner build --delete-conflicting-ouputs 

## HOW TOs

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
2. Override buildWidgetContents() to return widget contents
Ex: LoginButtonWidget

- Navigation

1. Encapsulate navigation on AppNavigator.dart