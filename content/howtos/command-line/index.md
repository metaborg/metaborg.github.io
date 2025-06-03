# Running Spoofax from the Command-Line

You can run parts of a Spoofax language from the command-line with the Sunshine command-line interface. This is a separate Java application that loads a Spoofax language and gives the following options:

* Parse, to parse a single file and print the AST
* Analyze, to parse and analyze a single file and print the analyzed AST
* Transform, to parse, analyze and transform a single file and print the analyzed AST
* Build, to run a builder on a single file, which will parse, possibly analyze, transform and print the result

Use the `--help` flag for details.

## Installation

On any release notes page you can find the Sunshine JAR under Command-line utilities. This is an executable JAR with a command-line interface.

## Nailgun

If you use the command-line interface often or multiple times you may wish to speed up the process.
Every time to run Sunshine, there is overhead of the JVM startup time and the loading time for the Spoofax language.

If you wish to speed this up you can use the `server` command of Sunshine. This starts up a Nailgun server.
Install the [Nailgun client](https://www.martiansoftware.com/nailgun/), then use `ng sunshine --help` to see the commands available.

The commands on the server are slightly different from the normal commands as loading a language is a separate command now.
Languages are still loaded lazily, so the first time a language is used it will take longer, but after that things should run noticeably faster.

