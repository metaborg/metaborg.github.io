---
title: "Install on macOS ARM (M1/M2/M3)"
---
# How to install Spoofax on macOS ARM (M1/M2/M3)
Currently the Eclipse with bundled JRE does not yet support M1.  We recommend downloading [Spoofax Eclipse _without the embedded JRE_]({{ release.rel.eclipse.install.macos_64 }}).  Then either use the JDK 8 that is installed by default on macOS M1/M2, or install your own.

To configure Eclipse to use an installed JDK:

1.  In the Finder, right-click the Spoofax app, choose _Show Package Contents_.
2.  Browse to `Contents/Eclipse`.
3.  Edit the `eclipse.ini` file.
4.  Replace or add two lines at the top of the file with the `-vm` argument:

    ```
    -vm
    <path>
    ```

    Where `<path>` is the path of your JDK, using one of the approaches below.


## Using macOS default JDK
If you want to use the default JDK 8 that is installed with macOS, you can verify its version number:

```shell
java -version
```

This should print something like:

```
java version "1.8.0_202"
Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
```

The `-vm` path you should use in this case should be something like:

```
-vm
/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home/bin
```


## Installing a custom JDK
To install and use a custom JDK for Spoofax, we recommend using a [MacOS pkg installer](https://adoptium.net/en-GB/temurin/releases/?arch=x64&version=11&os=mac).  Note that only an x86 JDK is supported.  We tested this with JDK 11 (recommended) but Java 8 and newer should work.

Once installed, the `-vm` path in the Eclipse installation should be something like:

```
-vm
/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home/bin/java
```
