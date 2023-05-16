# References
This section contains the reference for Spoofax and its (meta-)languages.  For more background information on the ideas, architecture, and design decisions behind Spoofax and its meta-languages, see the [Background](../background/index.md) section.

The reference section should explain language constructs (syntax, statics, dynamics) and be structured following a taxonomy of the language

## Spoofax Meta-languages
The following meta-languages are part of Spoofax. Note that some of the Spoofax meta-languages listed below have been superseded, and their use is now deprecated.

### Syntax
The recommended language for specifying syntax is SDF3.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**SDF3**](./sdf3/index.md) | {{ maintained }}  Maintained  | [:material-source-branch: org.metaborg.meta.lang.template](https://github.com/metaborg/sdf/tree/master/org.metaborg.meta.lang.template) |
| [**SDF2**](./sdf2/index.md) | {{ available }}   Available   | [:material-source-branch: org.metaborg.meta.lang.sdf](https://github.com/metaborg/sdf/tree/master/org.metaborg.meta.lang.sdf) |


### Static Semantics
The recommended language for specifying static semantics is Statix.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**Statix**](./statix/index.md) | {{ maintained }}  Maintained  | [:material-source-branch: statix.lang](https://github.com/metaborg/nabl/tree/master/statix.lang) |
| **NaBL2**                       | {{ available }}   Available   | [:material-source-branch: nabl2.lang](https://github.com/metaborg/nabl/tree/master/nabl2.lang) |
| **NaBL**                        | {{ unsupported }} Unsupported | [:material-source-branch: org.metaborg.meta.lang.nabl](https://github.com/metaborg/nabl/tree/master/org.metaborg.meta.lang.nabl) |
| **TS**                          | {{ unsupported }} Unsupported | [:material-source-branch: org.metaborg.meta.lang.ts](https://github.com/metaborg/ts/tree/master/org.metaborg.meta.lang.ts) |


### Term Transformations
The recommended language for specifying term transformations is Stratego 2.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**Stratego 2**](./stratego/index.md) | {{ maintained }}  Maintained  | [:material-source-branch: stratego.lang](https://github.com/metaborg/stratego/tree/master/stratego.lang) |
| **Stratego**                          | {{ available }}   Available   | [:material-source-branch: org.metaborg.meta.lang.stratego](https://github.com/metaborg/stratego/tree/master/org.metaborg.meta.lang.stratego) |


### Testing
The recommended language for specifying tests of Spoofax languages is SPT.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**SPT**](./spt/index.md) | {{ maintained }}  Maintained  | [:material-source-branch: org.metaborg.meta.lang.spt](https://github.com/metaborg/spt/tree/master/org.metaborg.meta.lang.spt) |


### Dynammic semantics
The languages for specifying dynamic semantics are DynSem and Dynamix.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| **Dynamix** | {{ maintained }}  Maintained  | [:material-source-branch: lang.dynamix](https://github.com/metaborg/metaborg-dynamix/tree/master/lang.dynamix) |
| **DynSem**  | {{ available }}   Available   | [:material-source-branch: dynsem](https://github.com/metaborg/dynsem/tree/master/dynsem) |


### Editor services
The language for specifying editor services is ESV.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**ESV**](./esv/index.md) | {{ available }}  Available  | [:material-source-branch: org.metaborg.meta.lang.esv](https://github.com/metaborg/esv/tree/master/org.metaborg.meta.lang.esv) |


### Data flow analysis
The language for specifying data flow analysis is FlowSpec.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**FlowSpec**](./flowspec/index.md) | {{ available }}  Available  | [:material-source-branch: flowspec.lang](https://github.com/metaborg/flowspec/tree/master/flowspec.lang) |


### Build System
Pipelines for Interactive Environments (PIE) is the build system for Spoofax 3, and Cfg is the configuration language of Spoofax 3.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| [**PIE**](./pie/index.md) | {{ maintained }}  Maintained  | [:material-source-branch: pie.lang](https://github.com/metaborg/pie/tree/develop/lang/lang) |
| **Cfg**                   | {{ maintained }}  Maintained  | [:material-source-branch: cfg](https://github.com/metaborg/spoofax-pie/tree/develop/lwb/metalang/cfg/cfg) |



## Languages
The following language projects are among those developed using Spoofax.

|      | Status | Source Code |
| :--- | :----- | :---------- |
| **Java Front** | {{ maintained }}  Maintained  | [:material-source-branch: lang.java](https://github.com/metaborg/java-front/tree/master/lang.java) |
