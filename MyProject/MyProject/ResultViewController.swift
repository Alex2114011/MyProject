//
//  ResultViewController.swift
//  MyProject
//
//  Created by  Alex on 03.11.2020.
//

import UIKit

protocol SaveResultChanges: AnyObject {
    func saveChanges(title text: String, subtitle: String)
}

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTitle: UITextField!
    @IBOutlet weak var resultText: UITextView!
    var tmpArray = [Items]()

    
    weak var delegate: SaveResultChanges?
    
    
    init(with array: [Items]) {
        tmpArray = array
        
        super.init(nibName: String(describing: ResultViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chageText()
        setSaveButton()
    }
    
    
    func chageText(){
        let indexPath = IndexPath(row: tmpArray.count, section: 0)
        let title = tmpArray[indexPath.row].title
        let subTitle = tmpArray[indexPath.row].subTitle
        resultTitle.text = title
        resultText.text = subTitle
    }

    func setSaveButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton(parameter:)))
    }
    @objc func saveButton(parameter: UIBarButtonItem) {
//        self.delegate?.saveChanges(title: resultTitle.text ?? "", subtitle: resultText.text ?? "")
        self.navigationController?.popToRootViewController(animated: true) //Отклоняет контроллер, который был представлен контроллером представления модально.
    }

}
