//
//  BaseListAdapterViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 17/5/21.
//

import IGListKit

class BaseListAdapterViewModel: NSObject, ListAdapterViewModel {
    var sections: [Section]

    init(_ sections: [Section]) {
        self.sections = sections
    }

    func objects(for _: ListAdapter) -> [ListDiffable] {
        sections.map(\.viewModel)
    }

    func listAdapter(_: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let result = sections.filter {
            guard let object = object as? ListDiffable else { return false }
            return object.isEqual(toDiffableObject: $0.viewModel)
        }

        guard let controller = result.first else { fatalError("Section Controller not exist for \(object).") }
        return controller.sectionController
    }

    func emptyView(for _: ListAdapter) -> UIView? {
        nil
    }

    func layout(at index: Int) -> NSCollectionLayoutSection? {
        guard sections.indices.contains(index) else { return nil }
        return sections[index].layoutSection
    }
}
