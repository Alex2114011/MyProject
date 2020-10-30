//
//  ItemAddViewController.swift
//  MyProject
//
//  Created by  Alex on 29.10.2020.
//

import UIKit

protocol DeveloperEntryDelegate: AnyObject {
    func textDeveloperPlatform(_ text: String)
}

class ItemAddViewController: UIViewController {
    
    weak var delegate: DeveloperEntryDelegate?
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    //MARK: SetUI
    func setUI() {
        view.backgroundColor = .white
        self.title = "SecondVC"
        saveButton.layer.cornerRadius = 5.0
        setAddButton()
        updateSaveButtonState()
    }
    
    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(addButton(parameter:)))
    }
    
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        self.delegate?.textDeveloperPlatform(textField.text ?? "") // передаем значение на ItemListViewController
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
  
    
    //MARK: Change State button
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    func updateSaveButtonState(){
        let textInField = textField.text ?? ""
        if textInField.isEmpty{
            saveButton.isEnabled = false
            saveButton.backgroundColor = .gray
        }else{
            saveButton.isEnabled = true
            saveButton.backgroundColor = .blue
        }
    }
    
    //MARK:Selectors
    
    @objc func addButton(parameter: UIBarButtonItem) {
        self.navigationController?.dismiss(animated: true, completion: nil) //Отклоняет контроллер, который был представлен контроллером представления модально.
    }
    
    //MARK: Hide keyboard
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { // этот метод отвечает за то что должно происходить когда мы касаемся экрана
        self.view.endEditing(true) // передаем во view контроллер что редактирование закончилось клавиатура должна уйти с экрана
    }
}
