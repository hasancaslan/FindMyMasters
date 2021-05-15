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
    var sections: [ExploreSection]

    init(viewModel: ExploreViewModel, sections: [ExploreSection]) {
        self.viewModel = viewModel
        self.sections = sections
    }

    override convenience init() {
        let _sections: [ExploreSection] = [.featured, .diciplinesTitle, .diciplines, .countriesTitle, .countries]
        let _viewModel = ExploreViewModel()
        self.init(viewModel: _viewModel, sections: _sections)
    }

    func layoutSection(for section: ExploreSection) -> NSCollectionLayoutSection {
        layout(for: section).layoutSection()
    }

    func layout(for section: ExploreSection) -> LayoutSection {
        switch section {
        case .featured:
            return FeaturedLayoutSection()

        case .diciplinesTitle:
            return TitleLayoutSection()

        case .diciplines:
            return DiciplineLayoutSection()

        case .countriesTitle:
            return TitleLayoutSection()

        case .countries:
            return CountryLayoutSection()
        }
    }

    func model(for section: ExploreSection) -> ListDiffable {
        switch section {
        case .featured:
            return viewModel.featuredViewModel

        case .diciplinesTitle:
            return viewModel.diciplinesTitle

        case .diciplines:
            return viewModel.diciplineViewModel

        case .countriesTitle:
            return viewModel.countriesTitle

        case .countries:
            return viewModel.countryViewModel
        }
    }
}

// MARK: - ListAdapterDataSource

extension ExploreDataSource: ListAdapterDataSource {
    func objects(for _: ListAdapter) -> [ListDiffable] {
        let viewModel = ExploreViewModel()
        let items: [ListDiffable] =
            [viewModel.featuredViewModel, viewModel.diciplinesTitle, viewModel.diciplineViewModel, viewModel.countriesTitle, viewModel.countryViewModel] as [ListDiffable]
        return items
    }

    func listAdapter(_: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is FeaturedSectionViewModel {
            return FeaturedSectionController()
        } else if object is DiciplineSectionViewModel {
            return DiciplinesSectionController()
        } else if object is CountrySectionViewModel {
            return CountriesSectionController()
        } else {
            return TitleSectionController()
        }
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
            ),
        ]

    let diciplinesTitle =
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
            ),
        ]

    let countriesTitle =
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
            ),
        ]

    var featuredViewModel: FeaturedSectionViewModel {
        FeaturedSectionViewModel(cells: featuredData)
    }

    var diciplineViewModel: DiciplineSectionViewModel {
        DiciplineSectionViewModel(cells: diciplinesData)
    }

    var countryViewModel: CountrySectionViewModel {
        CountrySectionViewModel(cells: countryData)
    }
}
