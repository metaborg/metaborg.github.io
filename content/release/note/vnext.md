# Spoofax vNext

These are the release notes for the upcoming version of Spoofax.

See the corresponding [migration guide](../migrate/vnext.md) for migrating from Spoofax vPrev to Spoofax vNext.

## Fixes

- The "new Spoofax project" wizard was broken in 2.5.19, where the `Next` and `Finish` buttons would be greyed out. This was a regression after moving away from directly depending on Guava, where an editor validation check accidentally checked the negation of the original check. So validation always failed. This had been fixed now.

### Statix

- `RuleUtil.inline` did not insert equalities for ascribed values (i.e., `t@Term(...)` rule arguments), which made the inlined version too weak.

## Added

### Statix

- Multi-file projects using the traditional solver can now use scope graph libraries (i.e., scope graphs exported from other projects).
- Multi-file projects using the traditional solver can now have separate constraints for groups (i.e., packages derived from a directory structure).

## Changes

### Dependencies

- Introduced `jsglr.shared` and moved a small part of `org.spoofax.jsglr` there so that `org.spoofax.jsglr2` can depend on only that shared code. This makes `org.spoofax.jsglr2` independent of `org.spoofax.jsglr`, lowering the number of dependencies if you only use `org.spoofax.jsglr2`.
