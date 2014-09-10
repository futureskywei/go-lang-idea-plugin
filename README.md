# go-lang-idea-plugin in a can

This is a small Docker recipe to build the latest `go-lang-idea-plugin` dev version for `IntelliJ IDEA`.


## How to use this

    docker run --rm -v .:/target codejuggle/go-lang-idea-plugin

The container will build the plugin and copy the built plugin to `/target` which is mounted to current directory.
