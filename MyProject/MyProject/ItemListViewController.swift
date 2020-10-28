//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let identifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item list" // устанавливаем заголовок VC
        view.backgroundColor = .white // фон view
        setAddButton()
        
    }

    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton(parameter:)))
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //MARK: #selectors
   
    // селектор для кнопки который при нажатии направляет на второй экран
    @objc func addButton(parameter: UIBarButtonItem) {
       let secondVC = ItemAddViewController()
//        self.navigationController?.pushViewController(secondVC, animated: true)
       
        self.present(secondVC, animated: true, completion: nil)
    }
    
    
}

