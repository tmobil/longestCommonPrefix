//
//  ViewController.swift
//  Task
//
//  
<<<<<<< HEAD
//  Copyright © 2018 Sudheer Potta. All rights reserved.
=======
//  
>>>>>>> a467379de36b7f93b6bd4a7d5e357c6716aa1269
//

import UIKit

class ViewController: UIViewController {
<<<<<<< HEAD

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
=======
    
    @IBOutlet weak var prefixTF:UITextField?
    @IBOutlet weak var resultLbl:UILabel?
    @IBOutlet weak var prefixFindingBtn:UIButton?
    var componentArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prefixFindingBtn?.isEnabled = false;
        prefixFindingBtn?.setTitle("setUP", for: .normal)
>>>>>>> a467379de36b7f93b6bd4a7d5e357c6716aa1269
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
<<<<<<< HEAD
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
=======
                componentArray = Array(jsonResult1!.keys)
                prefixFindingBtn?.setTitle("Find Largest common prefix", for: .normal)
                print("Done")
>>>>>>> a467379de36b7f93b6bd4a7d5e357c6716aa1269
            } catch {
                // handle error
            }
        }
    }
    
<<<<<<< HEAD
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
=======
    @IBAction func findMyLCP(_ sender: Any) {
        
        let pred : NSPredicate = NSPredicate(format: "(SELF BEGINSWITH[c] %@)", (prefixTF?.text)!)
        let aArr = componentArray as NSArray
        let onlyArr : Array = aArr.filtered(using: pred)
        let yo = longestCommonPrefix(onlyArr.flatMap { String(describing: $0) })
        if yo == "" {
            resultLbl?.text = "NO prefix found"
            return
        }
        resultLbl?.text = yo
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        var longestPrefix = [Character](), index = 0
        
        guard let firstStr = strs.first else {
            return String(longestPrefix)
        }
        
        let firstStrChars = Array(firstStr)
        let strsChars = strs.map { Array($0) }
        
        while index < firstStr.count {
            
            longestPrefix.append(firstStrChars[index])
            
            for str in strsChars {
                if index >= str.count {
                    return String(longestPrefix.dropLast())
                }
                
                if str[index] != longestPrefix[index] {
                    return String(longestPrefix.dropLast())
                }
            }
            
            index += 1
        }
        
        return String(longestPrefix)
>>>>>>> a467379de36b7f93b6bd4a7d5e357c6716aa1269
    }
    
}



