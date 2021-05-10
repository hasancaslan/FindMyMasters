//
//  SmallCollectionViewSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct SmallCollectionViewSection<CellType: ConfigurableCell, DataType>: CollectionViewSection
where CellType.DataType == DataType, CellType: UICollectionViewCell {
    var data: [DataType]
    //    let data = [SmallCellItem(title: "Computer Science", subtitle: "1234 Programs", icon: UIImage(systemName: "desktopcomputer")!, buttonTitle: "Browse")]

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.92), heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

    //    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallCell.reuseIdentifier, for: indexPath) as! SmallCell
    //        cell.configure(data[0] as! SmallCellItem)
    //        return cell
    //    }
}
