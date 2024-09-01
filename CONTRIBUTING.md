# Contributing

Feel free to contribute, here at ViewState we are generating the project with [Tuist](https://docs.tuist.io/).

1 - Download mise

```sh
brew install mise
mise install
export PATH="$HOME/.local/share/mise/shims:$PATH"
```
2 - Install Tuist, this will open `ViewState.xcodeproj`

```sh
tuist install
tuist generate
```

If you want to change the project configuration you can use this command

```sh
open Tuist/Project.swift
```

3 - Open the PR
