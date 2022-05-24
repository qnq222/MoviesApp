//
//  PopularCell.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

class PopularCell: UICollectionViewCell {

    lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var cellTitle: PaddingLabel = {
        let label = PaddingLabel()
        label.text = "Movie Name"
        label.textColor = .secondaryLabel
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 20, weight: .bold))
        label.numberOfLines = 1
        label.topInset = 0
        label.leftInset = 4
        label.rightInset = 0
        label.bottomInset = 0 
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cellImage , cellTitle])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(){
        cellImage.constraint(height: 255)
        contentView.subviewsPreparedAL {vStack}
        vStack.pinToSuperView(top: 0, left: 0, bottom: nil, right: 0)
    }
    
    func config(with model: Popular){
        cellTitle.text = model.title
        cellImage.image = UIImage(named: "")
    }
    
    func config(with model: Actor){
        cellTitle.text = model.name
        cellImage.image = UIImage(named: "")
    }
}
