# github_dashboard

A Flutter application to show public repositories on GitHub.

Enter a github username and click the "search" button.

You will see the photo and the name, and  below a list of the public repositories.

Click on a repo to show detail on it.

![Image Dashboard](./images/screenshot1.png) ![Image Dashboard](./images/screenshot2.png)

## Getting Started

This repo uses annotations.\
To generate code, use the command : "flutter packages pub run build_runner build".

Check the strings.dart file, and add your github username and a github token (to generate  on github).\
static const username = ""; //Must be changed with your github username.\
static const accesstoken = ""; //Must be changed with your github token.

## TODO
[x] Widget for Avatar and Custom Card\
[x] Create 2 configurations, MOCK and DEV\
[x] Manage errors from WS\
[ ] Unit tests\
[ ] Dependency injection

## BUGS
- A rectangular container appears below the card on iOS emulator (not already test on real iOS phone)\
- in Unit test, the constructor of SearchViewModel seems to be not called...

## INJECTION
Use of the Google lib "inject" (https://github.com/google/inject.dart).\
A example can be find here: https://blog.usejournal.com/compile-time-dependency-injection-in-flutter-95bb190b4a71\

BUILD ERROR:\
I had to upgrade some dependencies in the inject.dart module because there was a lot of\
incompatibility, and I had a error during build:\
[SEVERE] inject.dart/package/inject_generator/lib/src/context.dart:106:51: \
Error: Method not found: 'ParsedLibraryResultImpl.tmp'.\
var parsedLibrary = ParsedLibraryResultImpl.tmp(element.library);\ 

Solution found on internet: 
use element.library.session.getParsedLibraryByElement(element.library);
instead of ParsedLibraryResultImpl.tmp(element.library); in Context.dart line 106

