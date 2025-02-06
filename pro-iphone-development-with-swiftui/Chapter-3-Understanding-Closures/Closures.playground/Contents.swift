import Foundation

// MARK: - Closures

func multiplyBy2(x: Int) -> Int {
    return x * 2
}

print(multiplyBy2(x: 10))

// One way to rewrite this function as a closure involves dropping the func keyword and
// the function name, then enclose the rest of the code in curly brackets like this:
let y = { (x: Int) -> Int in x * 2 }
print(y(10))

// A second way to write a closure is to eliminate the parameter list altogether like this:
let z = { x in x * 2 }
print(z(10))

// Still another shortcut is to eliminate the return keyword altogether like this:
let w = { x in x * 2 }
print(w(10))

// An even more condensed version of a closure simply displays the return calculation
// by eliminating any variables and replacing them with placeholders that identify different
// parameters such as
let v = { $0 * 2 }
print(v(10))

// MARK: - Closures with Multiple Parameters

func addNumbers(x: Int, y: Int) -> Int {
    return x + y
}

print(addNumbers(x: 4, y: 5))
let y2 = { x, y -> Int in x + y }
print(y2(4, 5))

let z2 = { (x: Int, y: Int) in x + y }
print(z2(4, 5))

let w2 = { (x: Int, y: Int) in x + y }
print(w2(4, 5))

let v2 = { $0 as Int + $1 as Int }
print(v2(4, 5))

// MARK: - Using Closures like Data

let addNumbers1 = { x, y -> Int in x + y }
let addNumbers2 = { (x: Int, y: Int) in x + y }
let addNumbers3 = { (x: Int, y: Int) in x + y }
let addNumbers4 = { $0 as Int + $1 as Int }

let closureArray = [addNumbers1(9, 1), addNumbers2(2, 3), addNumbers3(7, 6), addNumbers4(10, 2)]
print(closureArray.count)
for i in closureArray {
    print(i)
}

// MARK: - Using Trailing Closures

func simpleExample(closure: () -> Void) {
    print("1. Wake up")
    closure()
    print("4. Eat breakfast")
}

simpleExample {
    print("---2. Go to bathroom")
    print("---3. Brush teeth")
}

// MARK: - Passing Parameters to a Trailing Closure

func passParameters(closure: (Int, Int) -> Void) {
    print("First line")
    closure(4, 8)
    print("Second line")
}

passParameters { x, y in
    print("-- Closure code beginning")
    print("\(x * y)")
    print("-- ending")
}

// MARK: - Passing Parameters and Returning a Value from a Trailing Closure

func returnValue(closure: (Int, Int) -> Int) {
    print("First line")
    print("\(closure(5, 2))")
    print("Second line")
}

returnValue { x, y in
    x + y
}
