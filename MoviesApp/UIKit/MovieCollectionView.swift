//
//  MovieCollectionView.swift
//  MoviesApp
//
//  Created by Ayman AbuMutair on 24/05/2022.
//

import SwiftUI

struct MovieCollectionView: UIViewRepresentable {
    //The first one is the data that we parsed earlier => api data
    var allItems: [HomeSection:[Codable]]
    
    //a closure that will run every time one of the cells is selected.
    var didSelectItem: ((_ indexPath: IndexPath)->()) = {_ in }
    
    //a closure that will run when the see all button on the header view is tapped
    var seeAllforSection: ((_ section: HomeSection)->()) = {_ in }
    
    //in the first method is where we are going to initialise whatever view we want to use in swiftUI,
    //in this case, it’s a UICollectionView. Treat the makeUIView method as init(frame: CGRect) in a normal UIKit UIView.
    func makeUIView(context: Context) -> UICollectionView {
        //We retrieve the coordinator from the context which in turn gives us access to everything in the coordinator class.
        //We set the datasource and delegate to the coordinator because the coordinator conforms to those 2 protocols.
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: context.coordinator.createCompositionalLayout())
        collectionView.backgroundColor = .clear
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        
        // register cells:
        collectionView.register(TrendingCell.self, forCellWithReuseIdentifier: TrendingCell.identifier)
        collectionView.register(PopularCell.self, forCellWithReuseIdentifier: PopularCell.identifier)
        collectionView.register(UpcomingCell.self, forCellWithReuseIdentifier: UpcomingCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        return collectionView
    }
    
    //The second view is where you would normally update the view that you want to use in swiftUI.
    func updateUIView(_ collectionView: UICollectionView, context: Context) {
    }
    
    //This is the fourth method from the UIViewRepresentable protocol.
    //Its only job is to initialise a new Coordinator instance.
    func makeCoordinator() -> MovieCollectionView.Coordinator {
        Coordinator(self)
    }
    
    //The coordinator will be the class that will coordinate, as its name implies,
    //the interaction between swift UI with whatever UIView we are using.
    //This is the class that will handle all the datasource and delegate conformance.
    class Coordinator: NSObject,UICollectionViewDataSource, UICollectionViewDelegate{
        
        var parent: MovieCollectionView
        
        init(_ parent: MovieCollectionView) {
            self.parent = parent
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return parent.allItems.count
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.allItems[HomeSection.allCases[section]]?.count ?? 0
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            switch indexPath.section {
            case 0:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.identifier, for: indexPath) as? TrendingCell {
                    let model = parent.allItems[HomeSection.Trending]?[indexPath.item] as! Trending
                    cell.config(with: model)
                    return cell
                }
            case 1:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell{
                    let model = parent.allItems[HomeSection.Popular]?[indexPath.item] as! Popular
                    cell.config(with: model)
                    return cell
                }
            case 2:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCell.identifier, for: indexPath) as? UpcomingCell{
                    let model = parent.allItems[HomeSection.Upcoming]?[indexPath.item] as! Upcoming
                    cell.config(with: model)
                    return cell
                }
            default:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.identifier, for: indexPath) as? PopularCell{
                    let model = parent.allItems[HomeSection.Actors]?[indexPath.item] as! Actor
                    cell.config(with: model)
                    return cell
                }
            }
            
            return UICollectionViewCell()
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            parent.didSelectItem(indexPath)
        }
        
        func createCompositionalLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout{[weak self] index, environment in
                switch index{
                case 0:
                    return self?.createTrendingSection()
                case 1:
                    return self?.createSharedSection()
                case 2:
                    return self?.createUpcomingSection()
                default:
                    return self?.createSharedSection()
                }
            }
            let config = UICollectionViewCompositionalLayoutConfiguration()
            config.interSectionSpacing = 20
            layout.configuration = config
            return layout
        }
        
        func createSharedSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 6, bottom: 0, trailing: 6)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension:  .fractionalWidth(0.8))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }
        
        func createTrendingSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 14, bottom: 0, trailing: 14)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .fractionalWidth(0.5))
            let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }
        
        func createUpcomingSection() -> NSCollectionLayoutSection {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
            let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
            layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .fractionalWidth(0.42))
            let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])
            let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
            layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 13, leading: 0, bottom: 0, trailing: 0)
            layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
            layoutSection.boundarySupplementaryItems = [createSectionHeader()]
            return layoutSection
        }
        
        func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
            let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            return layoutSectionHeader
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
                header.headerName.text =  HomeSection.allCases[indexPath.section].rawValue
                header.onSeeAllClicked = { [weak self] in
                    self?.parent.seeAllforSection(HomeSection.allCases[indexPath.section])
                }
                return header
            default:
                return UICollectionReusableView()
            }
        }
        
    }
}


