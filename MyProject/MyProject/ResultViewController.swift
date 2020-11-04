//
//  ResultViewController.swift
//  MyProject
//
//  Created by  Alex on 03.11.2020.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTitle: UITextField!
    @IBOutlet weak var resultText: UITextView!   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
extension ResultViewController: ItemSendDelegate{
    func sendItem(with text: String, subText: String) {
        print(text)
        resultTitle.text = text
        resultTitle.text = subText
    }
    
    
}
