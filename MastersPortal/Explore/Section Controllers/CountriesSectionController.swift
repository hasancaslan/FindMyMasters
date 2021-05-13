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
    }
}

// MARK: - Data Source

extension CountriesSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? CountrySectionViewModel else { fatalError() }
        viewModel = object
        return object.cells
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: ListCell.reuseIdentifier, bundle: nil, for: self, at: index) as? ListCell else {
            fatalError("Could not return a Featured Cell")
        }

        return cell
    }

    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        return .zero
    }
}
