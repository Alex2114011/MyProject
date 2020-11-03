//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var array = [String]() // тестовый массив
    var itemsArray = [Items]()
    
    
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
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // создаем ячейку
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemListTableViewCell.self), for: indexPath) as? ItemListTableViewCell else { fatalError() }
        cell.changeText(text: itemsArray[indexPath.row].title, subTitle: itemsArray[indexPath.row].subTitle ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = ItemAddViewController()
        let navVC = UINavigationController(rootViewController: rootVC) // оборачиваем ItemAddViewController в свой NavigationController
        rootVC.delegate = self // подписываемся под делегирование
    }
    
    //MARK: Delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            itemsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // указываем высоту ячейки
        return 50.0
    }
    
    
    //MARK: #selectors
    
    // селектор для кнопки который при нажатии направляет на второй экран
    @objc func addButton(parameter: UIBarButtonItem) {
        let rootVC = ItemAddViewController()
        let navVC = UINavigationController(rootViewController: rootVC) // оборачиваем ItemAddViewController в свой NavigationController
        rootVC.delegate = self // подписываемся под делегирование
        present(navVC, animated: true, completion: nil) // открываем второй VC модально, в таком случае он будет иметь свой UIBarButtonItem
        
        //self.navigationController?.pushViewController(secondVC, animated: true)
    }
}



//MARK: Delegate to ItemAddViewController
extension ItemListViewController: ItemAddDelegate{
    func addItem(with text: String, subText: String) {
        let indexPath = IndexPath(row: itemsArray.count, section: 0) // создаем  indexPath с количеством элементов в массиве
        itemsArray.append(Items(title: text, subTitle: subText)) // добавляем элемен в массив
        tableView.insertRows(at: [indexPath], with: .fade) // позволяет в ставить новый элемент в таблицу
    }
    
}

