//
//  CatTableViewCell.swift
//  TheCatApp
//
//  Created by Guillermo on 10/05/23.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    
    static let nib = UINib(nibName: "CatTableViewCell", bundle: nil)
    static let identifier = "CatTableViewCell"

    @IBOutlet weak var catNameLabel: UILabel!
    @IBOutlet weak var catInteligenceLabel: UILabel!
    @IBOutlet weak var catCountryLabel: UILabel!
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var cardContent: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cardContent.layer.borderWidth = 1
        cardContent.layer.borderColor = UIColor.black.cgColor
        // Initialization code
    }

    func setUp(with cat: Cat?) {
        guard let cat = cat else {return}
        catNameLabel.text = cat.name
        catInteligenceLabel.text = "Inteligencia: \(cat.intelligence)"
        catCountryLabel.text = cat.country
        
//        catImageView.image = 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
