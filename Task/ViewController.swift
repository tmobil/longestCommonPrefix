//
//  ViewController.swift
//  Task
//
//  
//  Copyright © 2018 Sudheer Potta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadDataFromFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadDataFromFile() {
        if let path = Bundle.main.path(forResource: "english", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonResult1 = jsonResult as? Dictionary<String, AnyObject>
                let componentArray = Array(jsonResult1!.keys)
                let spk  = componentArray[..<20]
                var someStr = [String]()
                for item in componentArray {
                    let sp = isPalindrome(item)
                    if sp == true {
                        print(item)
                        someStr.append(item)
                    }
                }
                
                var yo = longestCommonPrefix(Array(spk))
                yo = longestCommonPrefix(["ab","ab","abc","abcd"])
                print(yo)
            } catch {
                // handle error
            }
        }
    }
    
    func isPalindrome(_ s: String) -> Bool {
        if s.count < 2 {
            return false
        }
        let symbols = s.lowercased().reversed()
        return String(symbols) == String(symbols.reversed())
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var s: String?          //Find the shortest string
        var length = Int.max    //Shortest string's length
        
        for str in strs {
            if str.characters.count < length {
                length = str.characters.count
                s = str
            }
        }
        
        if var s = s {
            var endIndex = s.endIndex
            for str in strs {
                while !s.isEmpty && !str.hasPrefix(s) {
                    endIndex = s.index(before: endIndex)
                    s = s.substring(to: endIndex)
                }
            }
            return s
        } else {
            return ""
        }
    }
    
}



