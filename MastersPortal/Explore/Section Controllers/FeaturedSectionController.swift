//
//  FeaturedSectionController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit
import UIKit

class FeaturedSectionController: ListBindingSectionController<FeaturedItemViewModel> {
    let layoutSection: FeaturedLayoutSection
    var viewModel: FeaturedSectionViewModel?

    override init() {
        layoutSection = FeaturedLayoutSection()
        super.init()
        dataSource = self
        selectionDelegate = self
    }

    //    var viewModel: FeaturedSectionViewModel? {
    //        didSet {
    //            collectionContext?.performBatch(
    //                animated: true,
    //                updates: { batchContext in
    //                    batchContext.reload(self)
    //                })
    //        }
    //    }
}

// MARK: - Data Source

extension FeaturedSectionController: ListBindingSectionControllerDataSource {
    func sectionController(_: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let object = object as? FeaturedSectionViewModel else { fatalError() }
        viewModel = object
        return object.cells
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, cellForViewModel _: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCell(withNibName: FeaturedCell.reuseIdentifier, bundle: nil, for: self, at: index) as? FeaturedCell else {
            fatalError("Could not return a Featured Cell")
        }

        return cell
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, sizeForViewModel _: Any, at _: Int) -> CGSize {
        return .zero
    }
}

// MARK: - Selection Delegate

extension FeaturedSectionController: ListBindingSectionControllerSelectionDelegate {
    func sectionController(_: ListBindingSectionController<ListDiffable>, didSelectItemAt index: Int, viewModel _: Any) {
        print("Selected: \(String(describing: viewModel?.cells[index]))")
    }

    func sectionController(_: ListBindingSectionController<ListDiffable>, didDeselectItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didHighlightItemAt _: Int, viewModel _: Any) {}

    func sectionController(_: ListBindingSectionController<ListDiffable>, didUnhighlightItemAt _: Int, viewModel _: Any) {}
}

// extension FeaturedSectionController {
//    override func numberOfItems() -> Int {
//        viewModel?.count ?? 0
//    }
//    override func cellForItem(at index: Int) -> UICollectionViewCell {
//                guard let context = collectionContext,
//                      let cell = context.dequeueReusableCell(withNibName: FeaturedCell.reuseIdentifier, bundle: Bundle.main, for: self, at: index) as? FeaturedCell,
//           let items = items else {  fatalError("Could not return an Featured Collection View Cell") }
//
//        cell.configure(items.cells[index])
//        return cell
//    }
//
//    override func didUpdate(to object: Any) {
//        items = object as? FeaturedSectionViewModel
//    }
// }
