//
//  SimpleListAdapterDataSource.swift
//  MastersPortal
//
//  Created by HASAN CAN on 17/5/21.
//

import IGListKit

class SimpleListAdapterDataSource: NSObject {
    var sections: [CollectionSection]

    init(_ sections: [CollectionSection]) {
        self.sections = sections
    }

    func layout(at index: Int) -> NSCollectionLayoutSection? {
        guard sections.indices.contains(index) else { return nil }
        return sections[index].layoutSection
    }
}

extension SimpleListAdapterDataSource: SectionsDataSource {
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
}
