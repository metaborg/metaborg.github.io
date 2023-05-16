---
title: "SDF3"
---
# SDF3 — Syntax Definition Formalism

SDF3 is a meta-language in Spoofax for syntax definition, and the latest member of the family of syntax definition formalisms, which were developed in the context of the ASF+SDF[@BrandDHJ01], Stratego/XT[@BravenboerKVV08], and Spoofax[@KatsV10] language workbenches.  It inherits many features of its predecessors [SDF2](../sdf2/index.md) and [SDF](../sdf/index.md).

[:material-message-question: How-tos](../../howtos/){ .md-button }
[:material-file-cog: Reference](../../reference/sdf3/index.md){ .md-button }
[:material-source-branch: Language](https://github.com/metaborg/sdf/tree/master/org.metaborg.meta.lang.template){ .md-button }

The most recognizable change is to the syntax of productions that should make it more familiar to users of other grammar formalisms.  Further, it introduces new features in order to support multi-purpose interpretations of syntax definitions.  The goals of the design of SDF3 are (1) to support the definition of the concrete and abstract syntax of formal languages (with an emphasis on programming languages), (2) to support declarative syntax definition so that there is no need to understand parsing algorithms in order to understand definitions[@KatsVW10], (3) to make syntax definitions readable and understandable so that they can be used as reference documentation, and (4) to support execution of syntax definitions as parsers, but also for other syntactic operations, i.e to support multi-purpose interpretation based on a single source.  The focus on multipurpose interpretation is driven by the role of SDF3 in the Spoofax language workbench[@KatsV10].

Key features of SDF3 include:

- template productions[@VollebregtKV12];
- error recovery[@JongeKVS12];
- layout constraints for layout-sensitive syntax[@ErdwegRKO12] [@AmorimSEV18];
- safe and complete disambiguation of expression grammars[@Amorim2019];
- placeholders and syntactic code completion[@AmorimEWV16].


## Structure
An SDF3 syntax definition is structured as a collection of [modules](modules.md), which may import each other.  Each module defines a number of [symbols](symbols.md), which are the building blocks of [productions](productions.md).  Productions are defined for [lexical](lexical-syntax.md), [context-free](context-free-syntax.md), or [kernel](kernel-syntax.md) syntax.  [Start symbols](start-symbols.md) indicate the entry point of a syntax definition.

Grammars can be [disambiguated](disambiguation.md) by means of rejects, priorities, associativity, and restrictions, and permissive grammars are automatically generated for [error-recovery](recovery.md) parsing.  Handwritten recovery rules can be added to tweak recovery behavior.

SDF3 automatically generates a pretty-printer for [template](templates.md)-based productions, and provides additional constructs for the definition of [layout-sensitive](layout-sensitivity.md) languages.

Several aspects related to syntax definition and parsing can be [configured](configuration.md).


## References

\bibliography
