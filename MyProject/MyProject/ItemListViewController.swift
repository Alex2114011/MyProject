//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC" // устанавливаем заголовок VC
        view.backgroundColor = .white // фон view
        setAddButton()
        
    }

    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton(parameter:)))
    }
    
    
    // селектор для кнопки который при нажатии направляет на второй экран
    @objc func addButton(parameter: UIBarButtonItem) {
       let secondVC = ItemAddViewController()
//        self.navigationController?.pushViewController(secondVC, animated: true)
       
        self.present(secondVC, animated: true, completion: nil)
    }
    
    
}

