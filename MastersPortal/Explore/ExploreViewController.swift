//
//  ExploreViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

class ExploreViewModel {
    var featuredData = [ExtraLargeCellItem](
        repeating:
            ExtraLargeCellItem(
                caption: "POPULAR",
                title: "Cyber Security",
                subtitle: "Koç University",
                thumbnail: Asset.DemoImages.kuCyber.image),
        count: 1)

    var diciplinesTitle = [
        SectionTitleItem(
            title: "Diciplines",
            navigationTitle: "See All")
    ]

    var diciplinesData = [SmallCellItem](
        repeating:
            SmallCellItem(
                title: "Computer Science",
                subtitle: "1234 Programs",
                icon: UIImage(systemName: "desktopcomputer")!,
                buttonTitle: "Browse"),
        count: 1)

    var countriesTitle = [
        SectionTitleItem(
            title: "Countries",
            navigationTitle: "See All")
    ]

    var countryData = [ListCellItem](
        repeating:
            ListCellItem(
                title: "Turkey",
                icon: UIImage()),
        count: 1)
}

enum Section: CaseIterable {
    case featured
    case diciplinesTitle
    case diciplines
    case countriesTitle
    case countries
}

class ExploreViewController: UIViewController {
    lazy var sections: [LayoutSection] = [
        FeaturedCollectionViewSection(),
        TitleCollectionViewSection(),
        SmallCollectionViewSection(),
        TitleCollectionViewSection(),
        ListCollectionViewSection()
    ]

    var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>!

    let viewModel = ExploreViewModel()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        //        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: ExtraLargeCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ExtraLargeCell.reuseIdentifier)
        collectionView.register(UINib(nibName: SmallCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
        collectionView.register(UINib(nibName: SectionTitleCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SectionTitleCell.reuseIdentifier)
        collectionView.register(UINib(nibName: ListCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ListCell.reuseIdentifier)

        collectionView.register(
            SectionTitleSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionTitleSupplementaryView.reuseIdentifier)

        return collectionView
    }()

    lazy var collectionViewLayout: UICollectionViewLayout = {
        var sections = self.sections
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            return sections[sectionIndex].layoutSection()
        }
        return layout
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Explore.Navigation.title

        addCollectionView()
        configureDataSource()
        configureHeader()

        var snapshot = NSDiffableDataSourceSnapshot<Section, AnyHashable>()

        snapshot.appendSections([.featured, .diciplinesTitle, .diciplines, .countriesTitle, .countries])
        snapshot.appendItems(viewModel.featuredData, toSection: .featured)
        snapshot.appendItems(viewModel.diciplinesTitle, toSection: .diciplinesTitle)
        snapshot.appendItems(viewModel.diciplinesData, toSection: .diciplines)
        snapshot.appendItems(viewModel.countriesTitle, toSection: .countriesTitle)
        snapshot.appendItems(viewModel.countryData, toSection: .countries)

        dataSource.apply(snapshot, animatingDifferences: false)
    }

    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView) {
            (
                collectionView: UICollectionView,
                indexPath: IndexPath,
                item: AnyHashable
            ) -> UICollectionViewCell? in

            return self.sections[indexPath.section].configureCell(collectionView: collectionView, indexPath: indexPath, item: item)
        }
    }

    func configureHeader() {
        dataSource.supplementaryViewProvider = {
            (
                collectionView: UICollectionView,
                _: String,
                indexPath: IndexPath
            )
                -> UICollectionReusableView? in
            return self.sections[indexPath.section].header(collectionView: collectionView, indexPath: indexPath)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }
}

// extension ExploreViewController: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        sections.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return sections[section].numberOfItems
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return sections[indexPath.section].getConfiguredCell(collectionView: collectionView, indexPath: indexPath)
//    }
// }

extension ExploreViewController: UICollectionViewDelegate {}
