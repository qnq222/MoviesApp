//
//  UpcomingCell.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

class UpcomingCell: UICollectionViewCell {
    
    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var movieTitle: UILabel = {
        let label = UILabel()
        label.text = "Movie Name"
        label.textColor = UIColor(named: "textColor")
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.numberOfLines = 2
        return label
    }()
    
    lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "December 25, 2019"
        label.textColor = UIColor.gray
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 15, weight: .regular))
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
        let labelsStack = UIStackView(arrangedSubviews: [movieTitle, releaseDateLabel])
        labelsStack.axis = .vertical
        labelsStack.distribution = .fill
        labelsStack.alignment = .leading
        labelsStack.spacing = 5
        
        let mainHorizotalStack = UIStackView(arrangedSubviews: [cellImage,labelsStack])
        mainHorizotalStack.axis = .horizontal
        mainHorizotalStack.distribution = .fill
        mainHorizotalStack.alignment = .center
        mainHorizotalStack.spacing = 12
        
        let mainStack = UIStackView(arrangedSubviews: [mainHorizotalStack])
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.alignment = .leading
        
        cellImage.constraint(width: 130)
        cellImage.constraint(height: 70)
        
        contentView.subviewsPreparedAL {
            mainHorizotalStack
        }
        
        mainHorizotalStack.pinToSuperView(top: 0, left: 12, bottom: 0, right: -12)
    }
    
    func config(with model: Upcoming){
        cellImage.image = UIImage(named: "")
        movieTitle.text = model.title
        releaseDateLabel.text = model.releaseDate
    }
}
