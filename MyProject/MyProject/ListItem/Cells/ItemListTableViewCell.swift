//
//  ItemListTableViewCell.swift
//  MyProject
//
//  Created by  Alex on 29.10.2020.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var item: Item?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        subTitleLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func changeText(text: String, subTitle: String){ // метод в котором изменяем текс в лейбле
        titleLabel.text = text
        subTitleLabel.text = subTitle
    }
    
    func configure(with item: Item) {
        self.item = item
        titleLabel.text = item.title
        subTitleLabel.text = item.subTitle
    }
    
    
}
