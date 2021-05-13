//
//  TitleSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class TitleSectionController: ListSectionController {
    var layoutSection: LayoutSection
    var viewModel: SectionTitleViewModel?

    override init() {
        layoutSection = TitleLayoutSection()
        super.init()
    }
}

// MARK: - Data Provider
extension TitleSectionController {
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext,
            let cell = context.dequeueReusableCell(withNibName: SectionTitleCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as? SectionTitleCell,
            let viewModel = viewModel
        else { fatalError() }

        cell.configure(viewModel)

        return cell
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? SectionTitleViewModel
    }
}
