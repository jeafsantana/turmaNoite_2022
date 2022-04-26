import UIKit

var greeting = "Hello, playground"

let dicionario: [String: [String]] = [
    "A": ["Amanda", "Alice", "Allison"],
    "B": ["Bruno", "Bárbara"]
]

let section: Int = 0

let chaves = Array(dicionario.keys)

print(chaves[section])
print(chaves[1])

