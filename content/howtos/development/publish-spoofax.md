---
title: "Publish"
---
# How to publish a new release of Spoofax
This how-to describes how to release Spoofax.


## Requirements
To release Spoofax, you must first be able to build Spoofax. Follow the [Maven](./setup-maven-for-spoofax-dev.md) and [Building](./build-spoofax.md) guides first.

To publish releases, you will need write access to the [`spoofax-releng`](https://github.com/metaborg/spoofax-releng) repository, to all submodule repositories in that repository, and to this documentation repository. An account with deploy access to our [artifact server](https://artifacts.metaborg.org/) is required. Ask an administrator of the Programming Languages group to get access to the repositories and artifact server.


## Instructions
1.  Prepare Maven deploy settings.

    1.  Open your `~/.m2/settings.xml` file.

    2.  Add a `#!xml <servers></servers>` section if it does not exist.

    3.  Add a server to the `servers` section with id `metaborg-nexus` that contains your username and password to our artifact server:

        ```xml
        <server>
            <id>metaborg-nexus</id>
            <username>myusername</username>
            <password>mypassword</password>
        </server>
        ```

    4.  Optionally encrypt your password by following the [Password Encryption guide](https://maven.apache.org/guides/mini/guide-encryption.html).

2.  Prepare the repository containing the build scripts.

    1.  Clone or re-use an existing clone of [`spoofax-releng`](https://github.com/metaborg/spoofax-releng) on the `master` branch. See [Cloning the source code](./build-spoofax.md#cloning-the-source-code).

    2.  Update it to the latest commit with:

        ```bash
        git pull --rebase && ./b checkout -y && ./b update
        ```

    3.  To enable Git pushing without having to supply a username and password via Git over HTTPS, run the following command to set the submodule remotes to SSH URLs:

        ```bash
        ./b set-remote -s
        ```

3.  Prepare the source code repository.

    1.  Make a separate clone (or re-use an existing one if you have released Spoofax before) of the `spoofax-release` branch of [`spoofax-releng`](https://github.com/metaborg/spoofax-releng). This must be a separate clone in a different directory from the first one. See [Cloning the source code](./build-spoofax.md#cloning-the-source-code).

    ??? info "Why two separate clones of `spoofax-releng`?"
        The reason for two separate clones of [`spoofax-releng`](https://github.com/metaborg/spoofax-releng) is that the release script will modify the files in the repository, which could include files of the release script itself. Therefore, we make a separate clone which the release script acts upon, so that it does not interfere with itself.

    2.  If reusing an existing clone, ensure that it is checked out to `spoofax-release` with:
        ```bash
        git checkout spoofax-release
        ```
        ...and update it to the latest commit with:
        ```bash
        git pull --rebase && ./b checkout -y && ./b update
        ```

    3.  If there are new submodules repositories, follow the steps for preparing new submodules below.

    4.  To enable Git pushing without having to supply a username and password via Git over HTTPS, run the following command to set the submodule remotes to SSH URLs:

        ```bash
        ./b set-remote -s
        ```

4.  Perform the release.

    1. Change directory into the repository cloned in step 2. For example:

        ```bash
        cd /Users/gohla/spoofax/master/spoofax-releng
        ```

    2.  Get an absolute path to the repository cloned in step 3. For example:
        ```
        /Users/gohla/spoofax/release/spoofax-releng
        ```

    3.  Determine whether the release will be _patch_ or _minor/major_. For a patch release, we do not bump the development version. For a minor or major release, we do.

    4.  Figure out what the _current development version_ of Spoofax is, what the _next release version_ should be, and if doing a non-patch release, what the _next development version_ should be. The release script will change the current development version into the next release version, deploy that, and then change the current development version to the next development version, and commit that. Setting the next development version is optional.

    5.  Execute the release script with the parameters you gathered:

        ```bash
        ./b --repo <release-repository> release \
          spoofax-release <release-version> \
          master <current-development-version> \
          --non-interactive \
          --maven-deploy \
          --maven-deploy-identifier metaborg-nexus \
          --maven-deploy-url http://artifacts.metaborg.org/content/repositories/releases/ \
          --nexus-deploy \
          --nexus-username <artifact-server-username> \
          --nexus-password <artifact-server-password> \
          --nexus-repo releases
        ```

        ...or for a major version, with `--next-develop-version`:

        ```bash
        ./b --repo <release-repository> release \
          spoofax-release <release-version> \
          master <current-development-version> \
          --next-develop-version <next-development-version> \
          --non-interactive \
          --maven-deploy \
          --maven-deploy-identifier metaborg-nexus \
          --maven-deploy-url http://artifacts.metaborg.org/content/repositories/releases/ \
          --nexus-deploy \
          --nexus-username <artifact-server-username> \
          --nexus-password <artifact-server-password> \
          --nexus-repo releases
        ```

        For example, if we currently are at development version `2.6.0-SNAPSHOT`, and would like to release minor version `2.6.0`, and update the development version to `2.7.0-SNAPSHOT`, we would execute the following command:

        ```bash
        cd /Users/gohla/spoofax/master/spoofax-releng
        ./b --repo /Users/gohla/spoofax/release/spoofax-releng release \
          spoofax-release 2.6.0 \
          master 2.6.0-SNAPSHOT \
          --next-develop-version 2.7.0-SNAPSHOT \
          --non-interactive \
          --maven-deploy \
          --maven-deploy-identifier metaborg-nexus \
          --maven-deploy-url http://artifacts.metaborg.org/content/repositories/releases/ \
          --nexus-deploy \
          --nexus-username myusername \
          --nexus-password mypassword \
          --nexus-repo releases
        ```

        Unfortunately, it is currently not possible to encrypt the artifact server password passed to the build script.


## New `spoofax-releng` Submodules
When adding a new submodule to the [`spoofax-releng`](https://github.com/metaborg/spoofax-releng) repository, the following steps must be performed before starting the automated release process:

- Add a `spoofax-release` branch to the submodule (pointing to the current `master` branch), and push that branch.
- Add the submodule to the `.gitmodule` file in the `spoofax-release` branch of the [`spoofax-releng`](https://github.com/metaborg/spoofax-releng) repository. Make sure that the branch of the submodule is set to `spoofax-release`, and that the remote is using an `https` URL. Commit and push this change.


## Updating the Release Archive
To update the release archive of this documentation site, perform the following steps after a release:

- [ ] Copy `content/release/migrate/vnext.rst` to `content/release/migrate/<release-version>.rst` (only if migrations are necessary):
    - [ ] Remove stub notice.
- [ ] Copy `content/release/note/vnext.rst` to `content/release/note/<release-version>.rst`:
    - [ ] Change vNext in the heading into `<release-version> (<current-date(DD-MM-YYYY)>)`
    - [ ] Remove stub notice.
    - [ ] Remove the link to the migration guide is not applicable.
    - [ ] Add small summary of the release as an introduction.
    - [ ] Add download links inclusion based on `<release-version>`, see the code in a previous release.
- [ ] Reset the `vnext.md` files:
    - [ ] Make a stubbed migration guide.
    - [ ] Make a stubbed release notes.
- [ ] Update `mkdocs.yml`:
    - [ ] Add the new migration guide to the navigation if applicable.
    - [ ] Add the new release notes to the navigation.
    - [ ] Update the copyright with new year, if needed.
- [ ] Update `tools/macro.py`:
    - [ ] Add the release and the date to `release_versions`.
