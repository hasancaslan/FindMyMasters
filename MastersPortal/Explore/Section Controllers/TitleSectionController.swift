//
//  TitleSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class TitleSectionController: ListSectionController {
    var viewModel: SectionTitleViewModel?
}

// MARK: - Data Provider

extension TitleSectionController {
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let context = collectionContext,
              let cell = context.dequeueReusableCell(withNibName: SectionTitleCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as? SectionTitleCell,
              let viewModel = viewModel
        else { fatalError() }

        cell.configure(viewModel)
        cell.delegate = self

        return cell
    }

    override func didUpdate(to object: Any) {
        viewModel = object as? SectionTitleViewModel
    }
}

extension TitleSectionController: SectionTitleCellDelegate {
    func didTapNavigation(cell _: SectionTitleCell) {
        print("See All")
        let controller = ProgramDetailViewController()
        controller.modalPresentationStyle = .overFullScreen
        viewController?.present(controller, animated: true, completion: nil)
    }
}
