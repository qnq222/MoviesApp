//
//  TrendingCell.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import UIKit

class TrendingCell: UICollectionViewCell {
    
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var cellTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Name"
        label.textColor = .white
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(){
        let gradientView = UIView(frame: CGRect(x: 0, y:  self.frame.height / 4 , width: self.frame.width, height: self.frame.height / 2) )
        gradientView.layer.cornerRadius = 20
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.frame
        gradient.colors = [UIColor.clear, UIColor.black.cgColor]
        gradientView.layer.insertSublayer(gradient, at: 0)
        
        contentView.subviewsPreparedAL {
            cellImage
            cellTitle
        }
        
        cellImage.subviewsPreparedAL {
            gradientView
        }
        
        cellImage.pinToSuperView()
        cellTitle.pinToSuperView(top: nil, left: 12, bottom: -12, right: -12)
    }
    
    func config(with model: Trending){
        cellImage.image = UIImage(named: "")
        cellTitle.text = model.title
    }
    
}
