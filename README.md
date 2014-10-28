# go-lang-idea-plugin in a can

This is a small Docker recipe to build the latest `go-lang-idea-plugin` dev version for `IntelliJ IDEA`.


## How to use this

    make
    make start

The container will build the plugin and copy the built plugin to `/target` which is mounted to current directory. The Docker container contains a cache buster to make sure that always the latest version from master branch of the plugin is being used in the build process.