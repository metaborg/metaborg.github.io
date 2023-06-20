# Format

The configuration is written in [YAML](http://yaml.org/), a
human-friendly textual data format. YAML is indentation sensitive, be
sure to properly indent nested elements with 2 spaces.

We use the
[commons-configuration2](https://commons.apache.org/proper/commons-configuration/index.html)
framework to process configuration, which supports variables, nesting,
and lists.

## Variables

Any existing configuration option can be used as a variable with the
`${var}` syntax, for example:

``` yaml
id: org.metaborg:org.metaborg.meta.lang.sdf:${metaborgVersion}
metaborgVersion: 2.0.0-SNAPSHOT
```

Here, the `${metaborgVersion}` variable reference is replaced with
`2.0.0-SNAPSHOT` when reading the `id` configuration option. Note that
the order in which configuration options and variable references occur
does not matter.

The `${path:root}` builtin property can be used to point to the root of
the language specification. Paths in the configuration must be absolute
unless stated otherwise. Use `${path:root}/` to make paths absolute,
relative to the project root, where required.

Furthermore, environment variables can be used through `${env:}`, for
example `${env:PATH}`. See the documentation on [variable
interpolation](https://commons.apache.org/proper/commons-configuration/userguide/howto_basicfeatures.html#Variable_Interpolation)
for more detailed informations on how variables work.

## Nesting

Configuration options can be nested by nesting YAML objects, for
example:

``` yaml
language:
  sdf:
    version: sdf2
```

results in the `language.sdf.version` option being set to `sdf2`, and
can be referenced with a variable using `${language.sdf.version}`. The
same option can be set in the following way:

``` yaml
language.sdf.version: sdf2
```

## Lists

Lists are supported using the YAML list syntax, for example:

``` yaml
dependencies:
  compile:
  - org.metaborg:org.metaborg.meta.lang.esv:${metaborgVersion}
  - org.metaborg:org.metaborg.meta.lang.nabl:${metaborgVersion}
  - org.metaborg:org.metaborg.meta.lang.test:${metaborgVersion}
```

results in the `dependencies.compile` option being set to a list with
elements:

-   `org.metaborg:org.metaborg.meta.lang.esv:${metaborgVersion}`
-   `org.metaborg:org.metaborg.meta.lang.nabl:${metaborgVersion}`
-   `org.metaborg:org.metaborg.meta.lang.test:${metaborgVersion}`
