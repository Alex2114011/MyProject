//
//  ItemAddViewController.swift
//  MyProject
//
//  Created by  Alex on 29.10.2020.
//

import UIKit


class ItemAddViewController: UIViewController {
    
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
    }
    
    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addButton(parameter:)))
    }
  
    @IBAction func tapSaveButton(_ sender: UIButton) {
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
