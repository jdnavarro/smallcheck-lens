# Change Log
All notable changes to this project will be documented in this file. This file
follows the formatting recommendations from [Keep a
CHANGELOG](http://keepachangelog.com/). This project adheres to [Semantic
Versioning](http://semver.org/).

[Unreleased][unreleased]
### Changed
- More sensible function names assuming qualified imports.

### Added
- *Exhaustive* property testing using `Series` product. Previous
  properties renamed appending `Sum`.

### Removed
- Main re-export module.
- Move `Tasty` modules to a separate package
  [`tasty-lens`](https://hackage.haskell.org/package/tasty-lens).

## [0.1] - 2015-05-27
### Added
- `SmallCheck` properties for each lens laws.
- `tasty` test trees for each `Lens` type.
- Tests for some `Lens`.

[unreleased]: https://github.com/jdnavarro/smallcheck-series/compare/v0.1...HEAD
[0.1]: https://github.com/jdnavarro/smallcheck-series/compare/1df060...v0.1
