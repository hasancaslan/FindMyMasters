//
//  SectionLayout.swift
//  MastersPortal
//
//  Created by HASAN CAN on 11/5/21.
//

import UIKit

protocol LayoutSection {
    func layoutSection() -> NSCollectionLayoutSection
    func configureCell(collectionView: UICollectionView, indexPath: IndexPath, item: AnyHashable) -> UICollectionViewCell
    func header(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView?
}

extension LayoutSection {
    func header(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionReusableView? {
        return nil
    }
}
