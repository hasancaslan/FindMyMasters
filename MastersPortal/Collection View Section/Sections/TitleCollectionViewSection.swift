//
//  TitleCollectionViewSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

struct TitleCollectionViewSection<CellType: ConfigurableCell, DataType>: CollectionViewSection
where CellType.DataType == DataType, CellType: UICollectionViewCell {
    var data: [DataType]

    func layoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    //    func configureCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
    //        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionTitleCell.reuseIdentifier, for: indexPath) as! SectionTitleCell
    //        cell.configure(data[0] as! SectionTitleItem)
    //        return cell
    //    }
}
