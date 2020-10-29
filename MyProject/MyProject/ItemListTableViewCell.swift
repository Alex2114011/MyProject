//
//  ItemListTableViewCell.swift
//  MyProject
//
//  Created by  Alex on 29.10.2020.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func changeText(text: String){ // метод в котором изменяем текс в лейбле
        label.text = text
    }
    
    
}
