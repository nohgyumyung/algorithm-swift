// https://programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func combi<T>(_ elements: Array<T>, _ k: Int) -> [[T]] {
    var result = [[T]]()

    func combination(_ idx: Int, _ combos: [T]) {
        if combos.count == k {
            result.append(combos)
            return
        }
        
        for i in idx..<elements.count {
            combination(i + 1, combos + [elements[i]])
        }
    }

    combination(0, [])
    
    return result
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    
    for n in course {
        var cnt = [String: Int]()
        
        for order in orders {
            let menus = combi(Array(order).map { String($0) }, n)
            
            for menu in menus {
                let menu = menu.sorted().joined()
                
                if cnt[menu] != nil {
                    cnt[menu]! += 1
                } else {
                    cnt[menu] = 1
                }
            }
        }
        
        if !cnt.isEmpty {
            let maxCnt = cnt.values.max()!
            
            if maxCnt < 2 {
                continue
            }
            
            for i in cnt.keys {
                if cnt[i] == maxCnt {
                    result.append(i)
                }
            }
        }
    }
    
    return result.sorted()
}