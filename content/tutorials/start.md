# Creating a Language Project

This guide will get you started with language development in Spoofax, within an Eclipse environment.

## Installation

First follow the [Installation Guide](../howtos/index.md#spoofax-installation) for instructions on how to download, install, and run Spoofax in Eclipse.

## Hello World Language

To get you started, let's do the 'hello world' of language development; the hello world language.
In Eclipse, open the new project dialog by choosing `#!gui File > New > Project` from the main menu.
In the new project dialog, select `#!gui Spoofax > Spoofax language` and press `#!gui Next` to open the wizard for creating a Spoofax language specification project.
As project name, choose `helloworld`, which will automatically fill in the identifier, name, and extension of the language.
Keep the defaults for the other fields and press `#!gui Finish` to create the project.
Once the project has been created, open and expand it in the package or project explorer view.

The syntax for the language is specified in the `syntax/helloworld.sdf3` SDF3 file.
[SDF3](../references/sdf3/index.md) is our syntax definition language, from which we derive a parser, pretty-printer, and syntactic completions from your language.
Currently, the syntax contains a single start symbol `#!sdf3 Start`, and a production that accepts an empty program: `#!sdf3 Start.Empty = <>`.
Remove that production and replace it with the following productions:

```sdf3
Start.Program = <<Word> <Word>>
Word.Hello = <hello>
Word.World = <world>
```

This grammar accepts a program consisting of 2 words, where the words can be `hello` or `world`, with any number of layout characters (whitespace, tabs, empty lines, comments, etc.) in between.

To observe our changes to the grammar, we must first rebuild the project by selecting `#!gui Project > Build Project`.
If this is greyed out, make sure that the project is selected in the project explorer.

Create a new file by choosing `#!gui File > New > File`, put the file at the root of the helloworld project and name it `test.hel`.
Open that file and try out the parser by typing `hello world`, any combinations of the 2 words, and with or without layout between words.

If everything went well, the syntax highlighter will highlight the words in purple, which is the default highlighting color for keywords.
To see the abstract syntax tree that the parser derives from your program, select `#!gui Spoofax > Syntax > Show parsed AST`.
If you make an error in the program, for example `hello worl`, an error message will show up indicating where the error is.

## How to proceed?

Guides for developing a language with Spoofax:

- [Declare Your Language](https://metaborgcube.github.io/declare-your-language/) - This book has not been updated for Spoofax 2.0 yet, but most content still applies.
- The materials of the Compiler Construction course of [2019](https://tudelft-cs4200.github.io/2019), [2020](https://tudelft-cs4200.github.io/2020), and [2021](https://tudelft-cs4200.github.io/2021) are still available and used Spoofax 2 to teach students to build a subset of Java, from syntax, to static analysis, to compilation to bytecode.

Reference manuals for our meta-languages:

-  [SDF3](../references/sdf3/index.md)
-  [Statix](../references/statix/index.md)
-  [Stratego](../references/stratego/index.md)
-  [ESV](../references/esv/index.md)
-  [SPT](../references/spt/index.md)
-  [Flowspec](../references/flowspec/index.md)
-  [PIE](../references/pie/index.md)

Example language specifications:

-  [paplj language](https://github.com/MetaBorgCube/declare-your-language/tree/core/paplj/paplj.full)