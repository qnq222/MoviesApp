//
//  HeaderView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    var onSeeAllClicked = {}
    
    lazy var headerName: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var seeAll: UILabel = {
        let label = UILabel()
        label.text = "See All"
        label.textColor = UIColor(named: "darkPurple")
        return label
    }()
    
    lazy var hStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [headerName , seeAll])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        backgroundColor = .clear
        
        subviewsPreparedAL {
            hStack
        }
        
        hStack.pinToSuperView(top: 0, left: 20, bottom: 0, right: -20)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tap)
    }
    
    @objc func didTap() {
        self.onSeeAllClicked()
    }
}
