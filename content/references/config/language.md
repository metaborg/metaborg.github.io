# Language Specification Project Configuration

This page describes the options in the `metaborg.yaml` file of a language
specification project. A language specification project is a project that
contains a language specification, which contain programs of meta-languages,
intended to be developed by a language developer. It is a specialization of an
end-user project, so all configuration options from [end-user projects](./project)
can also be used in language specification projects.

The following configuration options are mandatory:

## `id`

Identifier of the language the language specification is describing.

-   Format: `groupId:id:version` where version uses the Maven version
    syntax; `major.minor.patch(-qualifier)?`
-   Example:
    `id: org.metaborg:org.metaborg.meta.lang.sdf:2.0.0-SNAPSHOT`

## `name`

Name of the language the language specification is describing.

-   Example: `name: SDF`


The following configuration options are optional and revert to default
values when not specified:

## `dependencies`

Compile and source dependencies to other language components, and
dependencies to Java artifacts. See the [end-user projects](./project) page for
more information.

## `metaborgVersion`

Version of the MetaBorg tools to use.

-   Format: Maven version syntax (see `id` option)
-   Default: Current version of the running Spoofax
-   Example: `metaborgVersion: 2.0.0-SNAPSHOT`

## `contributions`

List of language implementation identifiers the language component
generated from this language specification contributes to.

-   Format: List of language implementation names and identifiers (see
    `id` option)

-   Default: Contribution to single language implementation with the
    same name and identifier of this language specification.

-   Example:

    ``` yaml
    contributions:
    - name: Green-Marl
      id: com.oracle:greenmarl:1.5.0-SNAPSHOT
    ```

## `generates`

List of language names this language specification generates files for,
and into which directory.

-   Format: List of language name and directory.

-   Default: None

-   Example:

    ``` yaml
    generates:
    - language: EditorService
      directory: src-gen
    - language: Stratego-Sugar
      directory: src-gen
    ```

## `exports`

List of files and directories this language specification exports for
use in other language components, and optionally to which language those
files and directories belong. Exported resources are packaged into the
language component artifact when built.

-   Format: List of exports. There are 3 kinds of exports which are
    described below
-   Default: None

### Language-specific Directory Export

A language-specific directory export, exports a directory with files of
a specific language. The directory **must be relative** to the project
root. Includes and excludes are relative to the specified directory.
These files can be used by other language components by specifying a
source dependency on the language component built from this language
specification.

-   Format: Language name, path to directory, optional list of includes,
    and optional list of excludes

-   Example:

    ``` yaml
    exports:
    - language: TemplateLang
      directory: syntax
    - language: ds
      directory: src-gen/ds-signatures
    - language: Stratego-Sugar
      directory: trans
      includes: "**/*.str"
    - language: Stratego-Sugar
      directory: src-gen
      includes: "**/*.str"
    ```

!!! warning Warning

    Includes and excludes are only used to package the correct resources
    into the language component artifact, Spoofax Core does not use the
    includes and excludes at this moment. This may cause differences in
    behaviour between development and deployment environments.

### Language-specific File Export

A language-specific file export, exports a single file of a specific
language. The file **must be relative** to the project root. The file
can be used by other language components by specifying a source
dependency on the language component built from this language
specification.

-   Format: Language name, path to file

-   Example:

    ``` yaml
    exports:
    - language: SDF
      file: include/libanalysis2.def
    ```

### Generic Resource Export

A generic resource export, exports any resources in a directory. The
directory **must be relative** to the project root. Includes and
excludes are relative to the specified directory. These files can be
used for tasks specific to the language specification, for example to
bundle library files with the language specification.

-   Format: Relative path to directory, optional list of includes, and
    optional list of excludes

-   Example:

    ``` yaml
    exports:
    - directory: ./
      includes:
        - lib-java/**/*
        - lib-webdsl/**/*
        - lib/webdsl/HQL-pretty.pp.af
        - lib/webdsl/WebDSL-pretty.pp.af
    ```

!!! warning Warning

    All paths are relative to the project root. Do **NOT** use
    `${path:root}` to make paths absolute!


!!! note Note

    For directory exports, a list of includes and excludes can be optionally
    specified, using the [Ant pattern
    syntax](https://ant.apache.org/manual/dirtasks.html#Patterns). If no
    includes or excludes are specified, all files in the directory are
    assumed to be included recursively.

!!! note Note

    Use `./` to use the root directory as export directory, `.` triggers an
    error in the YAML parser.

## `pardonedLanguages`

List of language names that are pardoned; any errors they produce will
not fail builds.

-   Format: List of language names

-   Default: None

-   Example:

    ``` yaml
    pardonedLanguages:
      - EditorService
      - Stratego-Sugar
      - SDF
    ```

## `language`

Language specific configuration options.


### `sdf`

Configuration options for SDF2 and SDF3.

#### `enabled`

Whether to enable sdf (parse table, parenthesizer) for the current
project or not.

-   Format: Either `true` or `false`.

-   Default: `true`

-   Example:

    ``` yaml
    language:
      sdf:
        enabled: false        
    ```

#### `parse-table`

The relative path to the parse table (if not specified in the ESV).

-   Default: `target/metaborg/sdf.tbl`

-   Example:

    ``` yaml
    language:
      sdf:
        parse-table: "tables/sdf.tbl"
    ```

#### `completion-parse-table`

The relative path to the completions parse table.

-   Default: `target/metaborg/sdf-completions.tbl`

-   Example:

    ``` yaml
    language:
      sdf:
        completion-parse-table: "tables/sdf-completions.tbl"
    ```

#### `version`

Version of SDF to use.

-   Format: Either `sdf2` or `sdf3`.

-   Default: `sdf3`

-   Example:

    ``` yaml
    language:
      sdf:
        version: sdf2
    ```

#### `sdf2table`

Version of sdf2table to use.

-   Format: Either `c`, `java`, or `dynamic`.

-   Default: `c`

-   Example:

    ``` yaml
    language:
      sdf:
        sdf2table: java
    ```

#### `jsglr-version`

Version of the JGSLR parser to use. The options listed after `v2` are
extensions of `v2`, [which are described
here](..syntax/configuration). Note that
some of these extensions are experimental.

-   Format: Either `v1`, `v2`, `data-dependent`, `incremental`,
    `layout-sensitive`, `recovery`, or `recovery-incremental`.

-   Default: `v1`

-   Example:

    ``` yaml
    language:
      sdf:
        jsglr-version: v2
    ```

#### `placeholder`

Configuration for completion placeholders.

-   Format: Quoted strings for prefix, and optionally, quoted strings
    for suffix.

-   Default: prefix: `[[`, and suffix: `]]`

-   Example:

    ``` yaml
    language:
      sdf:
        placeholder:
          prefix: "$"
    ```

#### `generate-namespaced`

Configuration for generating a namespaced grammar. A namespaced grammar
can be generated automatically from an SDF3 grammar. This namespacing is
done by adding the language name to all module names and sort names. The
generated grammar is put in src-gen/syntax.

  -   Format: Either `true` or `false`.

  -   Default: `false`

  -   Example:

      ``` yaml
      language:
        sdf:
          generate-namespaced: true
      ```

#### `externalDef`

External SDF definition file to use. If this is specified, the
`language.sdf.version` and `language.sdf.args` options are ignored, and
all SDF2 or SDF3 syntax files are ignored.

-   Example:

    ``` yaml
    language:
      sdf:
        externalDef: ${path:root}/syntax/Stratego-Sugar.def
    ```

#### `args`

List of additional arguments that are passed to `pack-sdf` when this
language specification is built.

-   Format: List of command-line arguments.

-   Default: None

-   Example:

    ``` yaml
    language:
      sdf:
        args:
        - -Idef
        - ${path:root}/lib/SDF.def
    ```


#### `sdf-meta`

List of SDF2 files that define a syntax mix of two or more languages,
which are turned into extra parse tables when this language
specification is built. These are typically used for mixing the grammar
of the language with that of Stratego to be able to use concrete syntax
of the language to describe abstract syntax in Stratego and transform
it.

-   Format: List of command-line arguments.

-   Default: \[Stratego-<languagename\>.sdf\]

-   Example:

    ``` yaml
    language:
      sdf:
        sdf-meta:
        - Stratego-Tiger.sdf
        - Stratego-Tiger-Java15.sdf
    ```

### `stratego`

Configuration options for Stratego.

#### `format`

The output format of the `strj` compiler when this language
specification is built.

-   Format: Either `ctree` or `jar`.

-   Default: `ctree`

-   Example:

    ``` yaml
    language:
      stratego:
        format: jar
    ```

#### `args`

List of additional arguments that are passed to strj when this language
specification is built.

-   Format: List of command-line arguments.

-   Default: None

-   Example:

    ``` yaml
    language:
      stratego:
        args:
        - -la
        - stratego-lib
        - -la
        - stratego-sglr
        - -la
    ```

### `statix`

Configuration options for Statix.

#### `mode`

-   Format: `traditional`, `concurrent` or `incremental`

-   Default: `traditional`

-   Example:

    ``` yaml
    language:
      statix:
        mode: incremental
    ```

## `build`

### `useBuildSystemSpec`

Whether to use the specification from the build system as a source of
configuration for that build system, or this configuration file.

For example, when set to `false` (the default), and Spoofax's Maven
plugin's pomless support is enabled through the `.mvn/settings.xml` 
file, Maven will entirely ignore the contents of the `pom.xml` file, 
and use this configuration file as a source of
information. When this is not desired, for example if your POM file has
information that is not covered in this configuration file, set it to
`true` to use the POM file. The `id`, `name`, and `dependencies` must be
duplicated from this configuration file into the POM file, since this
configuration file is ignored by Maven.

Note that Spoofax itself will use this configuration file regardless of
this setting. This setting is only used by build systems such as Maven
and Gradle.

-   Format: Either `true` or `false`.

-   Default: `false`

-   Example:

    ``` yaml
    build:
      useBuildSystemSpec: true
    ```

### Additional build steps

The `build` configuration option also hosts a list of
additional build steps.

-   Format: List of build steps. There are 2 kinds of additional build
    steps which are described below. Each build step has a phase in
    which it is executed, which can be one of the following:
    -   initialize: runs at the start of a build
    -   generateSources: runs after compilers for all compile
        dependencies have generated source files
    -   compile: runs after the build (i.e. pack-sdf, strj, etc. have
        been executed), but before compiling Java files
    -   pkg: runs after Java files have been compiled, and after
        packaging the language component
    -   clean: runs when the language specification is cleaned
-   Default: None

### `stratego-cli` (Stratego build step)

Build step that runs a command-line Stratego application.

-   Format: phase, strategy to run, and command-line arguments

-   Example:

    ``` yaml
    build:
      stratego-cli:
      - phase: compile
        strategy: org.strategoxt.tools.main-parse-pp-table
        args:
        - -i
        - ${path:root}/lib/EditorService-pretty.pp
        - -o
        - ${path:root}/target/metaborg/EditorService-pretty.pp.af
    ```

### `ant` (Ant build step)

Build step that runs a target from an Ant build script.

-   Format: phase, path to Ant build script, and target in the build
    script to execute

-   Example:

    ``` yaml
    build:
      ant:
      - phase: initialize
        file: ${path:root}/build.xml
        target: main
    ```
