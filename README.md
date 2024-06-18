# Tech Task

### Table of contents

- [Application structure](#project-structure)
- [Figma design ](#figma-design)
- [APK ](#APK)

### Dribble design

https://dribbble.com/shots/23780608-Real-Estate-App

### APK

https://github.com/satishkoladiya/real_estate_app/releases/tag/apk

### Application structure

your application structure should look like this:

```
├── Android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images of your application.
├── font                            - It contains all fonts of your application.
├── iOS                             - It contains files required to run the application on an iOS platform.
├── lib                             - The most important folder in the application, used to write most of the Dart code.
    ├── main.dart                   - Starting point of the application
    ├── screens
    │   ├── home_screen             - It contains home screen
    │   └── map_screen              - It contains map screen
    │   
    ├── view_models                 - It contains view models used in screen
    ├── widgets                     - It contains widgets on the screens
    ├── utility                     - It contains common files and utilities of the application
    └── config
         └── assets                 - It contains generalised image for app
         └── theme                  - It contains theme and colors
```