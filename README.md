Simple Kotlin compiler image for docker. It can help you to easily build Java and Javascript executable from Kotlin scripts. For example, if you have Kotlin/JS project, like:

    external fun require(module:String):dynamic

    val fs = require("fs")

    fun main() {
      fs.stat("/app/sample.js") {_, stat ->
        println(JSON.stringify(stat, null, 2))
      }
    }

And you want to compile it to Javascript (to minimize startup time), you can use this image as follow:

    FROM abodllahpour/kotlinc-docker AS builder
    WORKDIR /app
    COPY sample.kt .
    RUN kotlinc-js -output sample.js -meta-info -module-kind commonjs sample.kt

    FROM node:alpine
    WORKDIR /app
    COPY --from=builder /app/sample.js .
    RUN npm install kotlin
    CMD ["node", "sample.js"]

Check [example](example/) for more information.