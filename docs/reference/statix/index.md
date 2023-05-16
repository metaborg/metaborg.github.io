---
title: "Statix"
---
# Statix — Static Semantics
Statix is a Meta-language for the Specification of Static Semantics.

[:material-message-question: How-tos](../../howtos/){ .md-button }

## Structure
Statix specifications are organised in [modules](modules.md). In Statix, programs, types and all other data are represented using [terms](terms.md). Type-checking a program is performed by solving a set of [constraints](basic-constraints.md) over terms. In addition to these built-in constraints, specification writers can define their [own constraints](rules.md).

Type-checking is closely related to, and strongly intertwined with, name resolution. For that reason, Statix has built-in support for modelling name binding patterns in the form of [scope graphs](scope-graphs.md). During type-checking, names can be resolved using [queries](queries.md).

When transforming programs using in [Stratego](../stratego), Statix specifications can be executed, and the results accesssed using the [Stratego API for Statix](stratego-api.md).

Statix has a special [test format](tests.md), which can be used for isolating issues in a specification, or in the Statix ecosystem.

!!! tip
    Readers with little or no familiarity with Statix are recommended to read the [Language Concepts](concepts.md) section first.


## Sources
The sources of the different Statix components can be found at:

- :material-source-branch: [Statix Language](https://github.com/metaborg/nabl/tree/master/statix.lang)
- :material-source-branch: [Statix Runtime](https://github.com/metaborg/nabl/tree/master/statix.runtime)
- :material-source-branch: [Statix Solver](https://github.com/metaborg/nabl/tree/master/statix.solver)

## Background
The Statix[@AntwerpenPRV18] [@RouvoetAPKV20] meta-language provides support for the declarative definition of the static semantics of programming languages in terms of unification constraints and scope graph constraints for name resolution[@AntwerpenPRV18] guaranteeing query stability[@RouvoetAPKV20].
It is the successor of [Nabl2](../nabl2/index.md), and like its predecessor, it uses [scope graphs](../nabl2/index.md).

In NaBL2, the two stage type checking process entailed limitations for the type systems that could be expressed. In particular, it was not possible to generate constraints based on information computed during the second stage. For example, a subtyping rule operating on types computed during constraint resolution. Furthermore, the NaBL2 language itself was untyped, making it easy to make errors in specifications. The Statix language[@AntwerpenPRV18] was designed to overcome the limitations of NaBL2.

The language is typed, with signatures describing the types of ASTs, and typing rules declaring the types of predicates. The type system of Statix is expressed in NaBL2, making the specification of rules statically checked and much less prone to errors. This also provided a useful testbed of the ideas of scope graphs and constraints.

The generation and resolution of constraints is intertwined, in order to allow computing constraints over inferred information. Furthermore, in order to generalize the notions of visibility supported by the NaBL2 language, Statix features query constraints, in order to relate references to declarations, but also to compute sets of names based on broader criteria. For example, the definition of structural record types can be expressed by a query that produces all fields of a record.

Necessarily these changes entail that queries need to be executed in a scope graph that is not in its final form. This necessitate a theory of query stability. Name resolution queries such be scheduled such that they produce stable results, i.e. results that would also be produced at the end of the process. The this end a theory of _critical edges_ was developed that asserts when it is safe to perform a query in a certain scope[@RouvoetAPKV20].

The Statix solver implements the operational semantics on the language in order to automatically derive type checkers from specifications. Optimizations of this solver can be based on the generaly underlying theory and be applied to all languages for which Statix specifications have been written. One such optimization is the derivation of _implicitly parallel_ type checkers from Statix specifications[@AntwerpenV21-preprint].

## References

\bibliography
