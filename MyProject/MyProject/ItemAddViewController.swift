//
//  ItemAddViewController.swift
//  MyProject
//
//  Created by  Alex on 29.10.2020.
//

import UIKit

protocol ItemAddDelegate: AnyObject {
    func addItem(with text: String, subText: String)
}

class ItemAddViewController: UIViewController, UITextViewDelegate {
    
    weak var delegate: ItemAddDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var subTitleTextView: UITextView!
    var placeholder = "Введите текст"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddButton()
        updateSaveButtonState()
        subTitleTextView.delegate = self
    }
    
    
    //MARK: SetUI
    func setUI() {
        view.backgroundColor = .white
        self.title = "SecondVC"
        saveButton.layer.cornerRadius = 5.0
        subTitleTextView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
        subTitleTextView.layer.borderWidth = 0.5
        subTitleTextView.layer.cornerRadius = 5
        subTitleTextView.text = placeholder
        subTitleTextView.textColor = #colorLiteral(red: 0.7960080504, green: 0.7961236835, blue: 0.8038249612, alpha: 1)
    }
    
    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(addButton(parameter:)))
    }
    
    
    @IBAction func tapSaveButton(_ sender: UIButton) {
        if subTitleTextView.text == "Введите текст"{
            subTitleTextView.text = nil
        }
        self.delegate?.addItem(with: titleTextField.text ?? "", subText: subTitleTextView.text ?? "") // передаем значение на ItemListViewController
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
  //MARK: Add placeholder in TextView
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if subTitleTextView.textColor == #colorLiteral(red: 0.7960080504, green: 0.7961236835, blue: 0.8038249612, alpha: 1){
            subTitleTextView.text = nil
            subTitleTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if subTitleTextView.text.isEmpty{
            subTitleTextView.text = "Введите текст"
            subTitleTextView.textColor = #colorLiteral(red: 0.7960080504, green: 0.7961236835, blue: 0.8038249612, alpha: 1)
            placeholder = ""
        } else {
            placeholder = subTitleTextView.text
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholder = subTitleTextView.text
    }
    
    //MARK: Change State button
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    func updateSaveButtonState(){
        let textInField = titleTextField.text ?? ""
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
