# Directory structure migration (March 2016)

To clean up the structure of a language specification project, we've made the following changes:

* ESV
    * Main ESV file must be at `editor/Main.esv`. If it does not exist, no packed ESV file will be generated.
    * Packed ESV file: `target/metaborg/editor.esv.af`
* SDF
    * The RTG and signatures files are no longer generated for SDF3 projects, since SDF3 generates its own signatures.
    * The generated box pp files are no longer generated, and box pp files are no longer converted into pp.af files.
    * Definition: `src-gen/syntax/[LanguageName].def`
    * Permissive definition: `src-gen/syntax/[LanguageName]-permissive.def`
    * Parenthesizer: `src-gen/pp/[LanguageName]-parenthesize.str`
    * Parse table: `target/metaborg/sdf.tbl`
* Stratego
    * 'editor-common.generated' file: `src-gen/stratego/metaborg.str`
    * Ctree: `target/metaborg/stratego.ctree`
    * Generated Java files: `src-gen/stratego-java`
    * JAR: `target/metaborg/stratego.jar`
    * Java strategies: `src/main/strategies`
    * Java strategies JAR: `target/metaborg/stratego-javastrat.jar`
    * Build cache: `target/stratego-cache`
* DynSem
    * Manual Java: `src/main/ds`
    * Generated Java: `src-gen/ds-java`
* Other
    * Pluto build cache: `target/pluto`

To migrate your project, make the following changes:

* Change the file name of the main ESV file to `Main.esv`, and change its module to `Main`.
* In the main ESV file:
    * Change the parse table:
    ```esv
    table : target/metaborg/sdf.tbl
    ```
    * Change the Stratego providers
        * For ctree projects:
          ```esv
          provider : target/metaborg/stratego.ctree
          ```
        * For jar projects:
          ```esv
          provider : target/metaborg/stratego.jar
          ```
        * For projects with Java strategies:
          ```esv
          provider : target/metaborg/stratego.jar
          provider : target/metaborg/stratego-javastrat.jar
      ```
* In all Stratego, NaBL, TS files
    * Instead of importing `lib/editor-common.generated`, import `stratego/metaborg`.
    * Instead of importing `include/<langname>-parenthesize`, import `pp/<langname>-parenthesize`.
    * If you're using SDF3:
        * Instead of importing the signatures from `include/<langname>`, import them from `signatures/<langname>-sig`. These signatures are spread over multiple files, import all the required files to fix errors, since the Stratego editor does not handle transitive imports. You can also use the wildcard import `signatures/-` to import all signature files, if your syntax definition is not spread over multiple directories.
    * If you're using SDF2 or an external definition file:
        * Instead of importing the signatures from `include/<langname>`, import them from `signatures/<langname>`.
* If your project has Java strategies:
    * Create the `src/main/strategies` directory.
    * Move Java strategies from `editor/java` into the `src/main/strategies` directory. Be sure to preserve the existing Java package structure.
* If your project has manual DynSem Java files:
    * Create the `src/main/ds` directory.
    * Move manual DynSem Java files from `editor/java` into the `src/main/ds` directory. Be sure to preserve the existing Java package structure.
* Perform a Maven update by right clicking the project and choosing `#!gui Maven > Update Project...`. Enable `#!gui Force Update of Snapshots/Releases` in the new window and press `#!gui Ok`. This updates the Java source directories of the project.
* If you are still using SDF2 instead of SDF3, add the following setting to the `metaborg.yaml` file:
```yaml
language:
  sdf:
    version: sdf2
```
