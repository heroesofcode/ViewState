# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

ViewState is a Swift Package Manager library that provides a typed state machine for asynchronous data loading in UIKit apps. It handles loading, success, and error states with an observer pattern, dispatching callbacks on the main thread.

## Commands

```bash
# Run tests on iOS Simulator
make test-ios

# Run tests on macOS
make test-macos

# Run tests via SPM (faster for iteration)
swift test

# Run a single test
swift test --filter ViewStateTests/testVerifyFetchDatasWithSuccess
```

Xcode version is pinned in `.xcode-version`. CI uses `bundle install` + `make test-ios` + `make test-macos`.

## Architecture

Three source files in `Sources/ViewState/`:

- **`ViewState.swift`** — Public generic class `ViewState<T, E>` (success type, error type). Consumers call `.fetchSource {}` to register the async work, then chain `.loadingObserver`, `.successObserver`, `.errorObserver` to subscribe. The request fires automatically once both `successObserver` and `errorObserver` are registered (loading is optional). All state mutations run through a concurrent `DispatchQueue` with `.barrier` writes; callbacks are dispatched to `DispatchQueue.main`.
- **`Observable.swift`** — Internal value wrapper that holds a dictionary of `[Int: CompletionHandler]` observers keyed by `ObserverProtocol.id`. Notifies all observers synchronously on `didSet`.
- **`ObserverProtocol.swift`** — Protocol requiring an `id: Int` used as the observer key.

## Testing Pattern

Tests inject a `ViewStateSpy` (subclass of `ViewState<String, String>`) through the ViewModel constructor, overriding the three observer methods to capture boolean flags instead of executing real async logic. Test doubles live in `Tests/ViewStateTests/Doubles/`.

SwiftLint is disabled in `Tests/` and `Example/`. The main lint rule to know: all classes must be `final` unless they explicitly allow inheritance.
