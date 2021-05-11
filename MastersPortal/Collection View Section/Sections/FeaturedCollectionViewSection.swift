//
//  FeaturedCollectionViewSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct FeaturedCollectionViewSection: LayoutSection {
    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    func configureCell(collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtraLargeCell.reuseIdentifier, for: indexPath) as! ExtraLargeCell
        cell.configure(item as! ExtraLargeCellItem)
        return cell
    }
}
