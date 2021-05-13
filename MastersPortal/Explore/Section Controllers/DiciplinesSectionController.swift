//
//  DiciplinesSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class DiciplinesSectionController: ListBindingSectionController<DiciplineItemViewModel> {
    var layoutSection: LayoutSection
    var viewModel: DiciplineSectionViewModel?

    override init() {
        layoutSection = DiciplineLayoutSection()
        super.init()
        dataSource = self
    }
}

// MARK: - Data Source

extension DiciplinesSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? DiciplineSectionViewModel else { fatalError() }
        viewModel = object
        return object.cells
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: SmallCell.reuseIdentifier, bundle: nil, for: self, at: index) as? SmallCell else {
            fatalError("Could not return a Featured Cell")
        }
        return cell
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return .zero
    }
}
