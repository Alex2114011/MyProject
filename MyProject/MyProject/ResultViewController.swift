//
//  ResultViewController.swift
//  MyProject
//
//  Created by  Alex on 03.11.2020.
//

import UIKit

protocol SaveResultChanges: AnyObject {
    func saveChanges(with item: Items)
}

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTitle: UITextField!
    @IBOutlet weak var resultText: UITextView!
    var item: Items

    
    weak var delegate: SaveResultChanges?
    
    //MARK: без delegate тоже работает
    init(with item: Items) {//,  delegate: SaveResultChanges
        self.item = item
//    self.delegate = delegate
    super.init(nibName: String(describing: ResultViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chageText()
        setSaveButton()
        setUI()
    }
    
    func setUI() {
        view.backgroundColor = .white
        self.title = "ResultVC"
        resultText.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        resultText.layer.borderWidth = 0.5
        resultText.layer.cornerRadius = 5
        resultText.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    
    
    func chageText(){
        resultTitle.text = item.title
        resultText.text = item.subTitle
         }

    func setSaveButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton(parameter:)))
    }
    @objc func saveButton(parameter: UIBarButtonItem) {
        item.title = resultTitle.text ?? ""
        item.subTitle = resultText.text ?? ""
        self.delegate?.saveChanges(with: item)
        self.navigationController?.popToRootViewController(animated: true) //Отклоняет контроллер, который был представлен контроллером представления модально.
    }

}
