# Spoofax vNext Migration Guide

This is a stub for the migration guide of the upcoming version of Spoofax.

## Metaborg Version in metaborg.yaml
Before, the value of `metaborgVersion` in `metaborg.yaml` was hardcoded in Spoofax 2 to be `2.6.0-SNAPSHOT`. From now on, it is no longer hardcoded and must be explicitly specified in the `metaborg.yaml` file of a language project. For example:

```yaml
---
id: org.metaborg:mylang:1.0.0
name: mylang
metaborgVersion: 2.6.0-SNAPSHOT
# ...
```

If this is not done, the following error can occur:

```
MissingDependencyException: Language for dependency org.metaborg:org.metaborg.meta.lang.spt:2.5.20 does not exist
```



