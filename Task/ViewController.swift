//
//  ViewController.swift
//  Task
//
//  
//  
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var prefixTF:UITextField?
    @IBOutlet weak var resultLbl:UILabel?
    @IBOutlet weak var prefixFindingBtn:UIButton?
    var componentArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        prefixFindingBtn?.isEnabled = false;
        prefixFindingBtn?.setTitle("setUP", for: .normal)
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
                componentArray = Array(jsonResult1!.keys)
                prefixFindingBtn?.setTitle("Find Largest common prefix", for: .normal)
                print("Done")
            } catch {
                // handle error
            }
        }
    }
    
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
    }
    
}



