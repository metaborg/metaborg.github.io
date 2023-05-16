---
title: "NaBL2"
---
# NaBL2 - Name Binding Language

## Background
The study of the semantics of [NaBL](../nabl/index.md) (and its limits in expressiveness) led to the formulation of a general theory of name resolution based on scope graphs[@NeronTVW15].

The vertices of scope graphs are scopes and the edges model reachability. Declarations are associated with scopes.
Name resolution by means of a declarative resolution calculus is defined as finding a path from the scope of a reference to the scope of a declaration taking into account the structure of the scope graph extended with visibility rules formulated in terms of path well-formedness and path specificity.

### Constraint Language
Based on the theory of name resolution, a constraint language was defined with a declarative and operational semantics[@AntwerpenNTVW16].

The language was designed for a two stage type checking process. In the first phase unification and scope constraints are generated, in the second phase these constraints are solved. A distinctive feature of this approach with respect to other constraint-based approaches to type checking, is the fact that name resolution is deferred until constraint resolution. This makes the definition of type-dependent name resolution, e.g. for computing the types of record fields, straightforward.

The NaBL2 language was a concrete implementation of this design and was integrated into Spoofax. It featured concrete syntax for unification and scope graph constraints, and rules for mapping AST nodes to constraints.


## References

\bibliography
