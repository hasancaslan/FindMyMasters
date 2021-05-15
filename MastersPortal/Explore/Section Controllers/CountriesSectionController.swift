//
//  CountriesSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class CountriesSectionController: ListBindingSectionController<CountryItemViewModel> {
    var layoutSection: LayoutSection
    var viewModel: CountrySectionViewModel?

    override init() {
        layoutSection = CountryLayoutSection()
        super.init()
        dataSource = self
        selectionDelegate = self
    }
}

// MARK: - Data Source

extension CountriesSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? CountrySectionViewModel else { fatalError() }
        viewModel = object
        return object.cells
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, cellForViewModel _: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: ListCell.reuseIdentifier, bundle: nil, for: self, at: index) as? ListCell else {
            fatalError("Could not return a Featured Cell")
        }

        return cell
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, sizeForViewModel _: Any, at _: Int) -> CGSize {
        .zero
    }
}

// MARK: - Selection Delegate

extension CountriesSectionController: ListBindingSectionControllerSelectionDelegate {
    func sectionController(_: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel _: Any) {
        print("Selected: \(String(describing: viewModel?.cells[index]))")
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, didDeselectItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didHighlightItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didUnhighlightItemAt _: Int, viewModel _: Any) {}
}
