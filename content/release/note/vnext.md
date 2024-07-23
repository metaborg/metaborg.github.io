# Spoofax vNext

These are the release notes for the upcoming version of Spoofax.

See the corresponding [migration guide](../migrate/vnext.md) for migrating from Spoofax vPrev to Spoofax vNext.

## Fixes

### Statix
- `RuleUtil.inline` now inserts equalities for ascribed values
- Rule names are now unique across files
- List origins are now tracked, fixing spurious failure in NaBL2 solver

## Added

## Changes
- The value of `metaborgVersion` in `metaborg.yaml` is no longer hardcoded and must be specified explicitly in the `metaborg.yaml` file of a language project. See the migration guide.

### Dependencies
- Introduced `util-vfs2` and moved the parts of `org.metaborg.util` that depend on `org.apache.commons:commons-vfs2` to there. This makes it possible for parts of Spoofax that do not use vfs2 to not depend on vfs2.
- Loading a parse table and using it to parse a file (example in [`spoofax2-lang-example:java/parse`](https://github.com/MetaBorgCube/spoofax2-lang-example/tree/main/java/parse)) no longer depends on `commons-io:commons-io`. The only third-party dependencies are now `jakarta.annotation:jakarta.annotation-api`, `org.slf4j:slf4j-api` and `io.usethesource:capsule`.
- `com.virtlink.commons:commons-configuration2-jackson1`: 1.3.1 -> 1.3.5
- `com.fasterxml.jackson.core:jackson-core`: 2.14.0 -> 2.17.1
- `com.fasterxml.jackson.core:jackson-databind`: 2.14.0 -> 2.17.1
- `com.fasterxml.jackson.core:jackson-annotations`: 2.14.0 -> 2.17.1
- `com.fasterxml.jackson.dataformat:jackson-dataformat-yaml`: 2.14.0 -> 2.17.1
