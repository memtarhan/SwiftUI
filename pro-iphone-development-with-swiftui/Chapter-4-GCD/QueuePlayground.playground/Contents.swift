import UIKit

let queue1 = DispatchQueue(label: "queue1")
let queue2 = DispatchQueue(label: "queue2")
let queue3 = DispatchQueue(label: "queue3")

queue1.sync { () in
    print(queue1.label)
}

queue2.sync { () in
    print(queue2.label)
}

queue3.sync { () in
    print(queue3.label)
}

queue1.async { () in
    print(queue1.label)
}

queue2.async { () in
    print(queue2.label)
}

queue3.async { () in
    print(queue3.label)
}

print("Program stopped")
