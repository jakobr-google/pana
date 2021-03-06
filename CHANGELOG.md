## 0.9.1

* Use raw links for images in repository URLs.

* Move unconstrained version penalty from health score to maintenance.

* Move platform conflict penalty from health score to maintenance.

* Sort maintenance suggestions in decreasing importance.

## 0.9.0+1

* Fix NPE when dependency has no constraint (e.g. git repo).

## 0.9.0

* Only direct unconstrained dependencies decrease the health score.

* Removed superfluous `pubspec.lock` validation.

* Recommend descriptions between 60 and 180 characters.

* Detect another license format

* Pass-through values of `analyzer_options.yaml` errors like `uri_has_not_been_generated`.

## 0.8.2

* Unblock platform classification on a new class of errors.

* Better messages in platform classification.

## 0.8.1

* Use Flutter-recommended analysis options when analyzer Flutter packages.

* **BREAKING BEHAVIOR**: Don't use `PUB_HOSTED_URL` for package downloads,
  as it has not worked out in practice. Instead, we've added a `--hosted-url`
  command line argument.

## 0.8.0

* `PackageAnalyzer.inspectPackage` added a named argument 
  `deleteTemporaryDirectory`. Setting this to `false` retains the
  directory and prints its location to the log. Useful for debugging.

* `Maintenance`
  * **BREAKING** `getMaintenanceScore` now takes an optional `age` parameter 
    replacing the previously required `publishDate` parameter.

  * Changed the meaning of version fields:
    * `isExperimentalVersion` now means pre-V1.
    * `isPreReleaseVersion` now means there is a pre-release flag
      like `-beta`, `-alpha`, etc.
  
  * **BREAKING** maintenance-related `Suggestion` entries as moved to `Maintenance.suggestions`

* **BREAKING** `Suggestion.file` is now `String` instead of `dynamic`.

* Detect the new format of native extensions.

* Unblock platform classification on a new class of errors.

* Use `PUB_HOSTED_URL` for package downloads.

## 0.7.3+1

* Allow more versions of `package:args`.

## 0.7.3

* Added `pana` as an executable.
  Enables `pub global activate pana`.

* Improved license detection: commented license files are now recognized.

## 0.7.2

* Handle more critical exceptions and report them with more details.

* The `Suggestion.bug` constructor had a breaking change – a required argument
  was added, but this is not intended for invocation by end-users.

## 0.7.1

* Add `SuggestionLevel.bug` and use it to record fatal errors with the tool.

## 0.7.0+1

* Fixed issue where analyzer and/or formatter were run on directories with no
  Dart files.

## 0.7.0

* **Breaking changes**

  * `Summary.sdkVersion` is now a `Version` instead of `String`.
  
  * `new PackageAnalyzer(...)` now takes a `DartSdk` instance instead of
    a `String`.

* `static Future<PackageAnalyzer> create(...)` was added to `PackageAnalyzer`.

* Added `logger` optional argument to `PackageAnalyzer.inspectPackage`.

## 0.6.2

* Allow platform classification for a small class of analysis errors.

## 0.6.1

* Don't count the absence of an `analysis_options.yaml` file against a package. 

## 0.6.0

* **Breaking changes**

  * Removed `ToolProblem` class.
  * Removed `Summary.toolProblems`, in favor of `Summary.suggestions`.

* Detect and store maintenance-related data in summary.

  * Scoring of tool problems moved from `Fitness` to `Maintenance`.

* Provide human-readable feedback and instructions on some of the issues
  we find during the analysis.

## 0.5.1

* Use a consistent 2 minute timeout for all processes.

* Classify platform as `nowhere` when part of analysis fails.

## 0.5.0

* **Breaking changes**

  * `License` renamed to `LicenseFile`
  * `Summary.license` -> `licenses`: we'll return multiple licenses
  * Removed `LicenseNames.missing`: empty List will indicate no license file

* Greatly expanded and improved license detection.

## 0.4.0

* **Breaking changes**

  * Renamed `AnalyzerIssue` -> `ToolProblem`
    * Renamed `Summary.issues` -> `toolProblems`
    * Renamed `AnalyzerIssue.scope` -> `tool`
    * Renamed `AnalyzerScopes` -> `ToolNames`

  * Renamed `AnalyzerOutput` -> `CodeProblem`
    * Renamed `Summary.analyzerItems` and `DartFileSummary.analyzerItems` -> `codeProblems`

  * Refactored `CodeProblem` (previously `AnalyzerOutput`):
    * Split up `type`, new fields: `severity`, `errorType`, `errorCode`
    * Renamed `error` to `description`

  * Refactored `Fitness`:
    * Renamed `total` -> `magnitude`
    * Removed `value`, using `shortcoming` instead (`value` = `magnitude - shortcoming;`)

  * Refactored `PubSummary`, renamed to `PkgResolution`
    * Moved `pubspec` -> `Summary`
    * Moved `pkgVersion` -> `Pubspec.version`
    * Moved `authors` -> `Pubspec.authors`
    * Merged `packageVersions` and `availableVersions` into `dependencies`
    * Renamed `Summary.pubSummary` -> `pkgResolution`

  * Refactored `platform`:
    * Renamed `PlatformFlags` -> `PlatformNames`
    * Removed most of the platform-related classes, using `DartPlatform` instead

## 0.3.0

* Removed `PlatformSummary.package` in favor of `PlatformSummary.pubspec` of
  (new) type `PubspecPlatform`.

* Renamed `KnownPlatforms` to `PlatformFlags`. Also:
  * Removed `mirrors`, `browser` and `standalone`.
  * Renamed `native` to `dartExtension`.

* `PlatformInfo`
  * Now store `dart:*` references directly in `uses`.
  * `worksInStandalone` renamed to `worksOnServer`.
  * Other `.worksIn*` renamed to `worksOn*`.
  * Added `String get description` which returns a simple `String` description
    of the supported platforms. Examples: `everywhere`, `flutter`, 
    `server, web`, `conflict`.
  * Removed `angular` as a value in `uses`.

## 0.2.4

* Detect native extensions.

* Detect licenses.

## 0.2.3

* Lot's of stability improvements.

* Improvements to error handling.

## 0.2.2

* Lot's of cleanup to JSON output.

* Improved stability.

* Platform detection basics.

## 0.2.1

* Added support for `flutter` packages.

* Expanded analysis to include transitive dependencies.

* Added scoring library.

* Moved the repo to `dart-lang`.

## 0.2.0

* A lot of tweaks. Still under heavy development.

## 0.0.1

* Initial version.
