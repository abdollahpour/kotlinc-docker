external fun require(module:String):dynamic

val fs = require("fs")

fun main() {
  fs.stat("/app/sample.js") {_, stat ->
    println(JSON.stringify(stat, null, 2))
  }
}
