//
//  ExploreDataSource.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import Foundation
import IGListKit

class ExploreDataSource: NSObject {
    let viewModel: ExploreViewModel

    init(_ viewModel: ExploreViewModel) {
        self.viewModel = viewModel
    }

    override convenience init() {
        let _viewModel = ExploreViewModel()
        self.init(_viewModel)
    }

    func layout(at index: Int) -> NSCollectionLayoutSection? {
        guard viewModel.sections.indices.contains(index) else { return nil }
        return viewModel.sections[index].layoutSection
    }
}

// MARK: - ListAdapterDataSource

extension ExploreDataSource: ListAdapterDataSource {
    func objects(for _: ListAdapter) -> [ListDiffable] {
        viewModel.sections.map(\.viewModel)
    }

    func listAdapter(_: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let result = viewModel.sections.filter { type(of: object) == type(of: $0.viewModel) }
        guard let controller = result.first else { fatalError("Section Controller not exist for \(object).") }
        return controller.sectionController
    }

    func emptyView(for _: ListAdapter) -> UIView? {
        nil
    }
}

class ExploreViewModel {
    private let featuredData =
        [
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            ),
            FeaturedItemViewModel(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image
            )
        ]

    private let diciplinesTitle =
        SectionTitleViewModel(
            title: "Diciplines",
            navigationTitle: "See All"
        )

    private let diciplinesData =
        [
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            ),
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            ),
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            ),
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            ),
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            ),
            DiciplineItemViewModel(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"
            )
        ]

    private let countriesTitle =
        SectionTitleViewModel(
            title: "Countries",
            navigationTitle: "See All"
        )

    private let countryData =
        [
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            ),
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            ),
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            ),
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            ),
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            ),
            CountryItemViewModel(
                title: "Turkey",
                icon: UIImage()
            )
        ]

    private var featuredViewModel: FeaturedSectionViewModel {
        FeaturedSectionViewModel(cells: featuredData)
    }

    private var diciplineViewModel: DiciplineSectionViewModel {
        DiciplineSectionViewModel(cells: diciplinesData)
    }

    private var countryViewModel: CountrySectionViewModel {
        CountrySectionViewModel(cells: countryData)
    }

    var sections: [Section] {
        [
            FeaturedSection(featuredViewModel),
            SectionTitleSection(diciplinesTitle),
            DiciplinesSection(diciplineViewModel),
            SectionTitleSection(countriesTitle),
            CountriesSection(countryViewModel)
        ]
    }
}
