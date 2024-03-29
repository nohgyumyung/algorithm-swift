// https://programmers.co.kr/learn/courses/30/lessons/42628

import Foundation

struct PriorityQueue<Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
}

func solution(_ operations: [String]) -> [Int] {
    var maxPriorityQueue = PriorityQueue<Int>(sort: >)
    var minPriorityQueue = PriorityQueue<Int>(sort: <)
    
    for operation in operations {
        let operation = operation.components(separatedBy: " ")
        let (command, data) = (operation[0], Int(operation[1])!)
        
        switch command {
        case "I":
            maxPriorityQueue.insert(data)
            minPriorityQueue.insert(data)
        case "D":
            if data == 1 {
                guard let element = maxPriorityQueue.remove(at: 0) else { break }
                guard let index = minPriorityQueue.index(of: element, startingAt: 0) else { break }
                minPriorityQueue.remove(at: index)
            } else {
                guard let element = minPriorityQueue.remove(at: 0) else { break }
                guard let index = maxPriorityQueue.index(of: element, startingAt: 0) else { break }
                maxPriorityQueue.remove(at: index)
            }
        default:
            break
        }
    }
    
    return [maxPriorityQueue.peek() ?? 0, minPriorityQueue.peek() ?? 0]
}