//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var array = ["Первая строка","Вторая строка", "Третья строка","Четвертая строка"] // тестовый массив
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC" // устанавливаем заголовок VC
        view.backgroundColor = .white // фон view
        delegate()
        register()
        setAddButton()
    }
    
    func setAddButton() { //добавляем кнопку на навбар
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButton(parameter:)))
    }
    func delegate(){ // подписываемся под протоколы
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() { // регистрируем ячейку
        tableView.register(UINib(nibName: String(describing: ItemListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ItemListTableViewCell.self))
    }
    
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // указываем количество ячеек
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // создаем ячейку
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemListTableViewCell.self), for: indexPath) as? ItemListTableViewCell else { fatalError() }
        cell.changeText(text: array[indexPath.row])
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // указываем высоту ячейки
        return 50.0
    }
    
    
    //MARK: #selectors
    
    // селектор для кнопки который при нажатии направляет на второй экран
    @objc func addButton(parameter: UIBarButtonItem) {
        let secondVC = ItemAddViewController()
        //        self.navigationController?.pushViewController(secondVC, animated: true)
        
        self.present(secondVC, animated: true, completion: nil)
    }
    
    
}

