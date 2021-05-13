//
//  SectionLayout.swift
//  MastersPortal
//
//  Created by HASAN CAN on 11/5/21.
//

import IGListKit
import UIKit

protocol LayoutSection {
    func layoutSection() -> NSCollectionLayoutSection
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell
//    func sectionController() -> ListSectionController
//    func header(collectionContext: ListCollectionContext, indexPath: IndexPath) -> UICollectionReusableView?
}

// extension LayoutSection {
//    func header(collectionContext: ListCollectionContext, indexPath: IndexPath) -> UICollectionReusableView? {
//        return nil
//    }
// }

// extension LayoutSection {
//    func configureCell(collectionContext: ListCollectionContext, sectionController: ListSectionController, index: Int, item: AnyHashable) -> UICollectionViewCell {
//        let cell = collectionContext.dequeueReusableCell(withNibName: CellType.reuseIdentifier, bundle: Bundle.main, for: sectionController, at: index)
//
//        if let cell = cell as? CellType {
//            cell.configure(item)
//        }
//
//        return cell
//    }
// }
