# Project Configuration

This page describes the configuration options in a `metaborg.yaml` file of a
Spoofax end-user project. An end-user project is a project that contains programs of languages,
intended to be developed by an end-user of those languages. The
configuration for an end-user project specifies dependencies.

## `dependencies`

Compile and source dependencies to other language components, and
dependencies to Java artifacts.

### `compile`

List of compile dependencies to language components. A compile
dependency to a language component indicates that this project uses
files of that language, and as such its compiler should be invoked.

-   Format: List of language component identifiers (see `id` option
    below)

-   Default: None

-   Example:

    ``` yaml
    dependencies:
      compile:
      - org.metaborg:org.metaborg.meta.lang.esv:${metaborgVersion}
    ```

### `source`

List of source dependencies to language components. A source dependency
to a language component indicates that this project uses exported files
of that language or library.

-   Format: List of language component identifiers (see `id` option
    below)

-   Default: None

-   Example:

    ``` yaml
    dependencies:
      source:
      - org.metaborg:org.metaborg.meta.lib.analysis:${metaborgVersion}
    ```

### `java`

List of dependencies to Java artifacts. A Java artifact dependency
indicates that when this project is compiled, the Java artifact should
be added to the compilation classpath. Spoofax currently does nothing
with these dependencies, but they are used by Maven when compiling the
project.

-   Format: List of Maven artifact identifiers (see `id` option below)

-   Default: None

-   Example:

    ``` yaml
    dependencies:
      java:
      - com.google.guava:guava:19.0
      - com.google.inject:guice:4.0
    ```
!!! warning Warning

    There is currently a bug in the version parser that parses versions with
    1 or 2 components to a version with 3 components. For example, the
    version [1]{.title-ref} is parsed to [1.0.0]{.title-ref}, and
    [4.0]{.title-ref} to [4.0.0]{.title-ref}. This will cause build failures
    since dependencies with those versions cannot be found.


## `runtime`

### `statix`

All options under the `runtime.statix` options configure the behavior of the
[Statix](../../statix) solver in this project. The available options are:

| Option                      | Values       | Default | Description                                                                                                                          |
| :-------------------------- | :----------- | :------ | :----------------------------------------------------------------------------------------------------------------------------------- |
| `test-log`                  | `none|error|warn|info|debug|trace` | `none` | Executing an [`stxtest`](../../statix/tests) will emit logging with the specified level in the Eclipse Console.                  |
| `suppress-cascading-errors` | `true|false` | `true`  | When set to `true`, the solver will not emit messages for constraints that could not be solved due to other constraints failing.     |
| `message-trace-length`      | An integer   | `0`     | The number of constraints in the causation trace to print below the error message. `-1` prints the full trace.                       |
| `message-term-depth`        | An integer   | `3`     | The depth in which terms are printed inside an error message. For deeper terms, and ellipsis is printed. `-1` prints infinite terms. |

In addition, there is a `modes` parameter, which manages the solver modes in
this project. This parameter contains subnodes consisting of a language name as
key, and either `traditional` (default), `concurrent` of `incremental` as value.
This setting overrides the default solver mode set by the language definition.

The Statix segment of an configuration file can look as follows.
```yaml
runtime:
  statix:
    test-log: debug
    suppress-cascading-errors: true
    message-trace-length: 4
    message-term-depth: -1
    modes:
      MyLang: concurrent
```
