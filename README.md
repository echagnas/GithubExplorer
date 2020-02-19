# github_dashboard

A Flutter application to show public repositories on GitHub.

Enter a github username and click the "search" button.

You will see the photo and the name, and  below a list of the public repositories.

Click on a repo to show detail on it.

## Getting Started

This repo uses annotations.\
To generate code, use the command : "flutter packages pub run build_runner build".

Check the strings.dart file, and add your github username and a github token (to generate  on github).\
static const username = ""; //Must be changed with your github username.\
static const accesstoken = ""; //Must be changed with your github token.

## TODO
[ ] Widget for Avatar and Custom Card\
[ ] Manage errors from WS\
[ ] Unit tests\
[ ] Dependency injection

## BUGS
- A rectangular container appears below the card on iOS emulator (not already test on real iOS phone)\
- in Unit test, the constructor of SearchViewModel seems to be not called...
