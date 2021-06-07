//
//  CollectionSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import IGListKit

protocol CollectionSection {
    var layoutSection: NSCollectionLayoutSection { get }
    var viewModel: ListDiffable { get set }
    var sectionController: ListSectionController { get }
}
