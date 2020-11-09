//
//  ViewController.swift
//  MyProject
//
//  Created by  Alex on 26.10.2020.
//

import UIKit

class ItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ItemListViewModel
    
    init(viewModel: ItemListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: ItemListViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FirstVC" // устанавливаем заголовок VC
        view.backgroundColor = .white // фон view
        viewModel.viewReady()
        delegate()
        registerCell()
        setAddButton()
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
        return viewModel.itemsArray.count
    }
    
    ///Метод для создания ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // создаем ячейку
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ItemListTableViewCell.self), for: indexPath) as? ItemListTableViewCell else { fatalError() }
        let item = viewModel.itemsArray[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    /// Метод для определения действия при нажатии на ячейку
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let resultVC = ResultViewController(with: viewModel.itemsArray[indexPath.row], delegate: self)
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    //MARK: Delete row
    /// Метод для определяния действия стиля действий над ячейкой
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.remove(item: viewModel.itemsArray[indexPath.row])
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
}



//MARK: Delegate to ItemAddViewController
extension ItemListViewController: ItemAddDelegate{
    func addItem(with text: String, subText: String) {
        viewModel.addItem(with: Item(title: text, subTitle: subText))
        tableView.reloadData()
    }
    
}

//MARK: Delegate to ResultViewController
extension ItemListViewController:SaveResultChanges{
    func saveChanges(with item: Item) {
        viewModel.change(item: item)
        tableView.reloadData()
    }
    
}



