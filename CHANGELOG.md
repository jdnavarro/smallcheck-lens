# Change Log
All notable changes to this project will be documented in this file. This file
follows the formatting recommendations from [Keep a
CHANGELOG](http://keepachangelog.com/). This project adheres to [Semantic
Versioning](http://semver.org/).

## [0.3] - 2015-09-11
### Changed
- More sensible function names assuming qualified imports.
- Pass functor to use in `Traversal` as a `Proxy` instead of hardcoding
  the functors.
- Rank-2 `Lens-Like` everywhere.

### Added
- *Exhaustive* property testing using `Series` product. Previous
  properties renamed appending `Sum`.

### Removed
- Main re-export module.
- Move `Tasty` modules to a separate package
  [`tasty-lens`](https://hackage.haskell.org/package/tasty-lens).
- `pureMaybe`. Now a `Proxy functor` is used.

## [0.1] - 2015-05-27
### Added
- `SmallCheck` properties for each lens laws.
- `tasty` test trees for each `Lens` type.
- Tests for some `Lens`.

[0.3]: https://github.com/jdnavarro/smallcheck-lens/compare/v0.1...v0.3
[0.1]: https://github.com/jdnavarro/smallcheck-lens/compare/1df060...v0.1
