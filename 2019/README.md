# 2019 solutions

This year I chose [Elm](https://elm-lang.org) as my weapon of choice to solve the puzzles. Why? To be honest I just find writing Elm to be a lovely experience 😍.

## Usage

Each Elm module exposes all of its values and functions so we can use them in the REPL.

1. [Install Elm](https://guide.elm-lang.org/install/elm.html)
1. `$ elm repl`
1. `$ import DayX`
1. `$ (DayX.getAnswer | DayX.getAnswerPartX) DayX.puzzleInput`

## Tests

![Boy-That-Escalated-Quickly-Anchorman](https://user-images.githubusercontent.com/472595/70568779-420c2c00-1ba1-11ea-8b43-3eab76fa798c.gif)

- `$ npm install elm-test -g`
- `$ elm-test`
