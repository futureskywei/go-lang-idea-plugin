# go-lang-idea-plugin in a can

This is a small Docker recipe to build the latest `go-lang-idea-plugin` dev version for `IntelliJ IDEA`.


## How to use this

    docker run --rm -v .:/target codejuggle/go-lang-idea-plugin
    cp /data/go-lang-idea-plugin/dist/ro.redeul.google.go.jar /target
