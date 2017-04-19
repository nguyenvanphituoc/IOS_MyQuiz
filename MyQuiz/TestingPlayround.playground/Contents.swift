//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var sNumber = "100"

var pattern = "[-]?(\\d*)(\\.(\\d*))?"

let regex = try! NSRegularExpression(pattern: pattern, options: [.anchorsMatchLines])

let matches = regex.matches(in: sNumber, options: [], range: NSRange(location: 0, length: sNumber.characters.count))

let pattern1 = "[0-9]*"
let regex1 = NSPredicate(format:"SELF MATCHES %@", pattern);
regex1.evaluate(with: "07")