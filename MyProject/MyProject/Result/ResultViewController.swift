//
//  ResultViewController.swift
//  MyProject
//
//  Created by  Alex on 03.11.2020.
//

import UIKit

protocol SaveResultChanges: AnyObject {
    func saveChanges(with item: Item)
}

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTitle: UITextField!
    @IBOutlet weak var resultText: UITextView!
    var item: Item

    
    weak var delegate: SaveResultChanges?
    
    //MARK: Custom init for class
    
    /// Создаем кастомный инициализатоор для класса, через него осуществляется получение данных из вызывающего VC, в инициализируем модель данных Item и делегата
    init(with item: Item, delegate: SaveResultChanges) {
        self.item = item
        self.delegate = delegate
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
    
    //MARK: Setting UI Item
    func setUI() {
        view.backgroundColor = .white
        self.title = "ResultVC"
        resultText.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        resultText.layer.borderWidth = 0.5
        resultText.layer.cornerRadius = 5
        resultText.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
    ///добавляем кнопку на навбар
    func setSaveButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton(parameter:)))
    }
    
    
    //MARK: func set value to IBOutlet
    func chageText(){
        resultTitle.text = item.title
        resultText.text = item.subTitle
    }
    
    
    //MARK: Selectors
    ///При нажатии на кнопку сохранить значения из IBOutlet передаются в модель делегату, происходит возврат к RootViewController
    @objc func saveButton(parameter: UIBarButtonItem) {
        item.change(title: resultTitle.text ?? "")
        item.change(subtitle: resultText.text ?? "")
        self.delegate?.saveChanges(with: item)
        self.navigationController?.popToRootViewController(animated: true) //Отклоняет контроллер, который был представлен контроллером представления модально.
    }

}
