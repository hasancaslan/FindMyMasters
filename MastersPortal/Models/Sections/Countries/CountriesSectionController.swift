//
//  CountriesSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class CountriesSectionController: ListBindingSectionController<CountryItemViewModel> {
    typealias ViewModelType = CountriesSectionViewModel
    typealias CellType = ListCell

    var viewModel: ViewModelType?

    override init() {
        super.init()
        dataSource = self
        selectionDelegate = self
    }
}

// MARK: - Data Source

extension CountriesSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? ViewModelType else { fatalError() }
        viewModel = object
        return object.cells
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, cellForViewModel _: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: CellType.reuseIdentifier, bundle: nil, for: self, at: index) as? CellType else {
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
        guard let countryName = viewModel?.cells[index].title else { return }
        let cityListVC = StoryboardScene.City.cityListViewController.instantiate()
        cityListVC.countryName = countryName
        viewController?.navigationController?.pushViewController(cityListVC, animated: true)
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, didDeselectItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didHighlightItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didUnhighlightItemAt _: Int, viewModel _: Any) {}
}
