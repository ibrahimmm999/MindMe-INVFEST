# Invfest 7.0 - Android App
<h2 align="center">
   Aplikasi Digital MindMe 📲 <br/>
</h2>
<hr>

> To watch the live demo of the program [_here_](https://youtu.be/t0LETzfHDyw)

## Table of Contents
1. [General Info](#general-information)
2. [Member List](#member-list)
3. [Features](#features)
4. [Technologies Used](#technologies-used)
5. [Setup](#setup)
6. [Screenshots](#screenshots)
7. [Structure](#structure)
8. [Project Status](#project-status)
9. [Room for Improvement](#room-for-improvement)
10. [Acknowledgements](#acknowledgements)
11. [Contact](#contact)

<a name="general-information"></a>

## General Information
Aplikasi digital MindMe merupakan aplikasi yang kami kembangkan sebagai upaya untuk meningkatkan kualitas kesehatan mental serta wawasan self-care bagi pengguna. Aplikasi ini kami kembangkan dengan menggunakan framework flutter dan ber-basis aplikasi android. 

<a name="member-list"></a>

## Member List

| Nama                     | E-Mail                      |
| ------------------------ | --------------------------- |
| Ardhan Nur Urfan         | 18221118@std.stei.itb.ac.id |
| Imam Rusydi Ibrahim      | 18221140@std.stei.itb.ac.id |
| M. Rifqi Farhansyah      | 13521166@std.stei.itb.ac.id |

<a name="features"></a>

## Features
- Fitur jurnal harian adalah fitur yang dapat digunakan untuk mencurahkan isi hati mereka melalui tulisan.
- Fitur artikel dan video _bookmark_ adalah fitur yang ditujukan untuk memberikan edukasi terkait kesehatan mental dan _self-care_ kepada pengguna dalam bentuk kumpulan artikel dan video.
- Fitur _social_ adalah fitur yang dapat dimanfaatkan pengguna untuk berbagi curahan hatinya kepada khalayak umum secara anonim maupun tidak.
- Fitur konsultasi adalah fitur yang dapat digunakan oleh pengguna untuk melakukan konsultasi secara langsung dengan para tenaga ahli (konsultan psikoloh) yang sesuai dengan bidangnya.
- Fitur chat adalah fitur yang dapat digunakan oleh pengguna untuk berkomunikasi dengan konsultan psikolog yang telah dipilih atau melakukan _private chat_ dengan pengguna lain.

<a name="technologies-used"></a>

## Technologies Used
- Flutter - version 3.3.10

> Note: The version of the libraries above is the version that we used in this project. You can use the latest version of the libraries.

<a name="setup"></a>

## Setup
Kalian dapat melakukan setup project dengan cara clone repository ini dan install library-library di atas.

<a name="screenshots"></a>

## Screenshots
<p float="left">
  <img src="/image/HomePage.jpeg/" width=300>
  <!-- <p>Gambar 1. Home Page</p>
  <nl> -->
  <img src="/image/Profil.jpeg/"  width=300>
  <!-- <p>Gambar 2. Profile Page</p>
  <nl> -->
  <img src="/image/Chat.jpeg/"  width=300>
  <!-- <p>Gambar 3. Chat Page</p>
  <nl> -->
  <img src="/image/Consultan.jpeg/"  width=300>
  <!-- <p>Gambar 4. Consultant Room Page</p>
  <nl> -->
  <img src="/image/Socials.jpeg/"  width=300>
  <!-- <p>Gambar 5. Social Page</p>
  <nl> -->
  <img src="/image/SocialComment.jpeg/"  width=300>
  <!-- <p>Gambar 6. Social Page (comment)</p>
  <nl> -->
  <img src="/image/Article.jpeg/"  width=300>
  <!-- <p>Gambar 7. Article Page</p>
  <nl> -->
  <img src="/image/Video.jpeg/"  width=300>
  <!-- <p>Gambar 8. Videos Page</p>
  <nl> -->
</p>

<a name="structure"></a>

## Structure
```bash
│   README.md
│
└───src
    │   .gitignore
    │   .metadata
    │   analysis_options.yaml
    │   pubspec.lock
    │   pubspec.yaml
    │   README.md
    │
    ├───android
    │   │   .gitignore
    │   │   build.gradle
    │   │   gradle.properties
    │   │   settings.gradle
    │   │
    │   ├───.gradle
    │   │   ├───7.4.2
    │   │   │   │   gc.properties
    │   │   │   │
    │   │   │   ├───checksums
    │   │   │   │       checksums.lock
    │   │   │   │
    │   │   │   ├───fileChanges
    │   │   │   │       last-build.bin
    │   │   │   │
    │   │   │   ├───fileHashes
    │   │   │   │       fileHashes.lock
    │   │   │   │
    │   │   │   └───vcsMetadata
    │   │   └───vcs-1
    │   │           gc.properties
    │   │
    │   ├───app
    │   │   │   build.gradle
    │   │   │
    │   │   └───src
    │   │       ├───debug
    │   │       │       AndroidManifest.xml
    │   │       │
    │   │       ├───main
    │   │       │   │   AndroidManifest.xml
    │   │       │   │
    │   │       │   ├───kotlin
    │   │       │   │   └───com
    │   │       │   │       └───example
    │   │       │   │           └───src
    │   │       │   │                   MainActivity.kt
    │   │       │   │
    │   │       │   └───res
    │   │       │       ├───drawable
    │   │       │       │       launch_background.xml
    │   │       │       │
    │   │       │       ├───drawable-v21
    │   │       │       │       launch_background.xml
    │   │       │       │
    │   │       │       ├───mipmap-hdpi
    │   │       │       │       ic_launcher.png
    │   │       │       │
    │   │       │       ├───mipmap-mdpi
    │   │       │       │       ic_launcher.png
    │   │       │       │
    │   │       │       ├───mipmap-xhdpi
    │   │       │       │       ic_launcher.png
    │   │       │       │
    │   │       │       ├───mipmap-xxhdpi
    │   │       │       │       ic_launcher.png
    │   │       │       │
    │   │       │       ├───mipmap-xxxhdpi
    │   │       │       │       ic_launcher.png
    │   │       │       │
    │   │       │       ├───values
    │   │       │       │       styles.xml
    │   │       │       │
    │   │       │       └───values-night
    │   │       │               styles.xml
    │   │       │
    │   │       └───profile
    │   │               AndroidManifest.xml
    │   │
    │   └───gradle
    │       └───wrapper
    │               gradle-wrapper.properties
    │
    ├───ios
    │   │   .gitignore
    │   │
    │   ├───Flutter
    │   │       AppFrameworkInfo.plist
    │   │       Debug.xcconfig
    │   │       Release.xcconfig
    │   │
    │   ├───Runner
    │   │   │   AppDelegate.swift
    │   │   │   Info.plist
    │   │   │   Runner-Bridging-Header.h
    │   │   │
    │   │   ├───Assets.xcassets
    │   │   │   ├───AppIcon.appiconset
    │   │   │   │       Contents.json
    │   │   │   │       Icon-App-1024x1024@1x.png
    │   │   │   │       Icon-App-20x20@1x.png
    │   │   │   │       Icon-App-20x20@2x.png
    │   │   │   │       Icon-App-20x20@3x.png
    │   │   │   │       Icon-App-29x29@1x.png
    │   │   │   │       Icon-App-29x29@2x.png
    │   │   │   │       Icon-App-29x29@3x.png
    │   │   │   │       Icon-App-40x40@1x.png
    │   │   │   │       Icon-App-40x40@2x.png
    │   │   │   │       Icon-App-40x40@3x.png
    │   │   │   │       Icon-App-60x60@2x.png
    │   │   │   │       Icon-App-60x60@3x.png
    │   │   │   │       Icon-App-76x76@1x.png
    │   │   │   │       Icon-App-76x76@2x.png
    │   │   │   │       Icon-App-83.5x83.5@2x.png
    │   │   │   │
    │   │   │   └───LaunchImage.imageset
    │   │   │           Contents.json
    │   │   │           LaunchImage.png
    │   │   │           LaunchImage@2x.png
    │   │   │           LaunchImage@3x.png
    │   │   │           README.md
    │   │   │
    │   │   └───Base.lproj
    │   │           LaunchScreen.storyboard
    │   │           Main.storyboard
    │   │
    │   ├───Runner.xcodeproj
    │   │   │   project.pbxproj
    │   │   │
    │   │   ├───project.xcworkspace
    │   │   │   │   contents.xcworkspacedata
    │   │   │   │
    │   │   │   └───xcshareddata
    │   │   │           IDEWorkspaceChecks.plist
    │   │   │           WorkspaceSettings.xcsettings
    │   │   │
    │   │   └───xcshareddata
    │   │       └───xcschemes
    │   │               Runner.xcscheme
    │   │
    │   └───Runner.xcworkspace
    │       │   contents.xcworkspacedata
    │       │
    │       └───xcshareddata
    │               IDEWorkspaceChecks.plist
    │               WorkspaceSettings.xcsettings
    │
    ├───lib
    │   │   main.dart
    │   │
    │   └───shared
    │           theme.dart
    │
    ├───linux
    │   │   .gitignore
    │   │   CMakeLists.txt
    │   │   main.cc
    │   │   my_application.cc
    │   │   my_application.h
    │   │
    │   └───flutter
    │           CMakeLists.txt
    │           generated_plugins.cmake
    │           generated_plugin_registrant.cc
    │           generated_plugin_registrant.h
    │
    ├───macos
    │   │   .gitignore
    │   │
    │   ├───Flutter
    │   │       Flutter-Debug.xcconfig
    │   │       Flutter-Release.xcconfig
    │   │       GeneratedPluginRegistrant.swift
    │   │
    │   ├───Runner
    │   │   │   AppDelegate.swift
    │   │   │   DebugProfile.entitlements
    │   │   │   Info.plist
    │   │   │   MainFlutterWindow.swift
    │   │   │   Release.entitlements
    │   │   │
    │   │   ├───Assets.xcassets
    │   │   │   └───AppIcon.appiconset
    │   │   │           app_icon_1024.png
    │   │   │           app_icon_128.png
    │   │   │           app_icon_16.png
    │   │   │           app_icon_256.png
    │   │   │           app_icon_32.png
    │   │   │           app_icon_512.png
    │   │   │           app_icon_64.png
    │   │   │           Contents.json
    │   │   │
    │   │   ├───Base.lproj
    │   │   │       MainMenu.xib
    │   │   │
    │   │   └───Configs
    │   │           AppInfo.xcconfig
    │   │           Debug.xcconfig
    │   │           Release.xcconfig
    │   │           Warnings.xcconfig
    │   │
    │   ├───Runner.xcodeproj
    │   │   │   project.pbxproj
    │   │   │
    │   │   ├───project.xcworkspace
    │   │   │   └───xcshareddata
    │   │   │           IDEWorkspaceChecks.plist
    │   │   │
    │   │   └───xcshareddata
    │   │       └───xcschemes
    │   │               Runner.xcscheme
    │   │
    │   └───Runner.xcworkspace
    │       │   contents.xcworkspacedata
    │       │
    │       └───xcshareddata
    │               IDEWorkspaceChecks.plist
    │
    ├───test
    │       widget_test.dart
    │
    ├───web
    │   │   favicon.png
    │   │   index.html
    │   │   manifest.json
    │   │
    │   └───icons
    │           Icon-192.png
    │           Icon-512.png
    │           Icon-maskable-192.png
    │           Icon-maskable-512.png
    │
    └───windows
        │   .gitignore
        │   CMakeLists.txt
        │
        ├───flutter
        │       CMakeLists.txt
        │       generated_plugins.cmake
        │       generated_plugin_registrant.cc
        │       generated_plugin_registrant.h
        │
        └───runner
            │   CMakeLists.txt
            │   flutter_window.cpp
            │   flutter_window.h
            │   main.cpp
            │   resource.h
            │   runner.exe.manifest
            │   Runner.rc
            │   utils.cpp
            │   utils.h
            │   win32_window.cpp
            │   win32_window.h
            │
            └───resources
                    app_icon.ico
```

<a name="project-status">

## Project Status
Status Proyek: _uncomplete_

<a name="room-for-improvement">

## Room for Improvement
Peningkatan yang dapat dilakukan:
- Penambahan fitur-fitur lainnya
- Peningkatan kuantitas responden pada survei selanjutnya

<a name="acknowledgements">

## Acknowledgements
- Terima kasih kepada Allah SWT
- Proyek ini terinspirasi oleh artikel [Mental Health During COVID-19](https://repository.unair.ac.id/116507/10/1_Korespondensi.pdf)

<a name="contact"></a>

## Contact
<h4 align="center">
  Copyrights @2022
</h4>
<hr>
