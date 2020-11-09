//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemsArray = [Item]()
    let defaults = Defaults.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC" // устанавливаем заголовок VC
        view.backgroundColor = .white // фон view
        delegate()
        registerCell()
        setAddButton()
        reloadData()
    }
    
    
    ///Добавляем кнопку на навбар для перехода на экран добавления элемента
    func setAddButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToAddList(parameter:)))
    }
    /// Подписываемся под протоколы
    func delegate(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    /// Регистрируем ячейку
    func registerCell() {
        tableView.register(UINib(nibName: String(describing: ItemListTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ItemListTableViewCell.self))
    }
    
    
    //MARK: UITableViewDataSource
    
    /// Метод определяющий количиство ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // указываем количество ячеек
        return itemsArray.count
    }
    
    ///Метод для создания ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // создаем ячейку
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemListTableViewCell.self), for: indexPath) as? ItemListTableViewCell else { fatalError() }
        cell.changeText(text: itemsArray[indexPath.row].title, subTitle: itemsArray[indexPath.row].subTitle ?? "")
        return cell
    }
    
    /// Метод для определения действия при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultVC = ResultViewController(with: itemsArray[indexPath.row], delegate: self)
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    //MARK: Delete row
    /// Метод для определяния действия стиля действий над ячейкой
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            itemsArray.remove(at: indexPath.row)
            defaults.set(itemsArray, for: .kItems)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    
    //MARK: UITableViewDelegate
    
    /// Метод для определения выстоты ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // указываем высоту ячейки
        return 50.0
    }
    
    
    //MARK: #selectors
    
    /// Селектор для кнопки который при нажатии направляет на второй экран
    @objc func navigateToAddList(parameter: UIBarButtonItem) {
        let rootVC = ItemAddViewController()
        let navVC = UINavigationController(rootViewController: rootVC) // оборачиваем ItemAddViewController в свой NavigationController
        rootVC.delegate = self // подписываемся под делегирование
        present(navVC, animated: true, completion: nil) // открываем второй VC модально, в таком случае он будет иметь свой UIBarButtonItem
        //self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    //MARK: Loding data from start App
    
    func reloadData(){
<<<<<<< HEAD
        guard let ItemArray = defaults.getObject(with: Key<[Item]>("kSaveArray")) else { return }
        self.itemsArray = ItemArray
=======
        guard let itemsArray = defaults.getObject(with: .kItems) else { return }
        self.itemsArray = itemsArray
>>>>>>> refactoring
    }
}



//MARK: Delegate to ItemAddViewController
extension ItemListViewController: ItemAddDelegate{
    func addItem(with text: String, subText: String) {
        let indexPath = IndexPath(row: itemsArray.count, section: 0) // создаем  indexPath с количеством элементов в массиве
<<<<<<< HEAD
        itemsArray.append(Item(title: text, subTitle: subText)) // добавляем элемен в массив
        defaults.set(itemsArray, for: "kSaveArray")
=======
        itemsArray.append(Items(title: text, subTitle: subText)) // добавляем элемен в массив
        defaults.set(itemsArray, for: .kItems)
>>>>>>> refactoring
        tableView.insertRows(at: [indexPath], with: .fade) // позволяет в ставить новый элемент в таблицу
    }
    
}

//MARK: Delegate to ResultViewController
extension ItemListViewController:SaveResultChanges{
<<<<<<< HEAD
    func saveChanges(with item: Item) {
        
        //первый вариант
        
        
//        if let indexReplace = itemsArray.firstIndex(where: { $0.id == item.id }) {
//            itemsArray.remove(at: indexReplace)
//            itemsArray.insert(item, at: indexReplace)
//        }
        
        //второй вариант
        
        itemsArray = itemsArray
            .map { (itemInArray) -> Item in
                if itemInArray.id == item.id {
                    return item
                }
                return itemInArray
            }
        
        defaultsUpdate()
        tableView.reloadData()
    }
    
    private func defaultsUpdate() {
        defaults.remove(for: "kSaveArray")
        defaults.set(self.itemsArray, for: "kSaveArray")
    }
=======
    func saveChanges(with item: Items) {
        defaults.set(itemsArray, for: .kItems)
        tableView.reloadData()
    }
    
}
>>>>>>> refactoring
    
}



