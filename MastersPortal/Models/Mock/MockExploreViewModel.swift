//
//  ExploreDataSource.swift
//  MastersPortal
//
//  Created by HASAN CAN on 12/5/21.
//

import IGListKit

// MARK: - ListAdapterDataSource

class MockExploreViewModel: NSObject {
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
            ),
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
            ),
        ]

    private var featuredViewModel: FeaturedSectionViewModel {
        FeaturedSectionViewModel(cells: featuredData)
    }

    private var diciplineViewModel: DiciplinesSectionViewModel {
        DiciplinesSectionViewModel(cells: diciplinesData)
    }

    private var countryViewModel: CountriesSectionViewModel {
        CountriesSectionViewModel(cells: countryData)
    }

    var sections: [CollectionSection] {
        [
            FeaturedSection(featuredViewModel),
            SectionTitleSection(diciplinesTitle),
            DiciplinesSection(diciplineViewModel),
            SectionTitleSection(countriesTitle),
            CountriesSection(countryViewModel),
        ]
    }
}
