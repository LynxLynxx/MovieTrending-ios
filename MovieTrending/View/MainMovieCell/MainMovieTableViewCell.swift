//
//  MainMovieTableViewCell.swift
//  MovieTrending
//
//  Created by Ryszard Schossler on 28/03/2024.
//

import UIKit
import SDWebImage

class MainMovieTableViewCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieTableViewCell"
        }
    }
    
    public static func register( ) -> UINib {
        UINib(nibName: "MainMovieTableViewCell", bundle: nil)
    }

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
}
