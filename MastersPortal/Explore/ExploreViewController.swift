//
//  ExploreViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//

import UIKit

typealias FeaturedSection = FeaturedCollectionViewSection<ExtraLargeCell, ExtraLargeCellItem>
typealias SectionTitle = TitleCollectionViewSection<SectionTitleCell, SectionTitleItem>
typealias SmallSection = SmallCollectionViewSection<SmallCell, SmallCellItem>
typealias ListSection = ListCollectionViewSection<ListCell, ListCellItem>

class ExploreViewModel {
    let sections: [ConfigurableSection] = [
        FeaturedSection(
            data: [ExtraLargeCellItem](
                repeating:
                    ExtraLargeCellItem(
                        caption: "POPULAR",
                        title: "Cyber Security",
                        subtitle: "Koç University",
                        thumbnail: Asset.DemoImages.kuCyber.image),
                count: 6)),
        SectionTitle(
            data: [
                SectionTitleItem(
                    title: "Diciplines",
                    navigationTitle: "See All")
            ]),
        SmallSection(
            data: [SmallCellItem](
                repeating:
                    SmallCellItem(
                        title: "Computer Science",
                        subtitle: "1234 Programs",
                        icon: UIImage(systemName: "desktopcomputer")!,
                        buttonTitle: "Browse"),
                count: 6)),
        SectionTitle(
            data: [
                SectionTitleItem(
                    title: "Countries",
                    navigationTitle: "See All")
            ]),
        ListSection(
            data: [ListCellItem](
                repeating:
                    ListCellItem(
                        title: "Turkey",
                        icon: UIImage()),
                count: 6))
    ]
}

class ExploreViewController: UIViewController {
    //    lazy var sections: [CollectionViewSection] = [
    //        FeaturedSection(<#[ExtraLargeCellItem]#>),
    //        TitleCollectionViewSection(),
    //        SmallCollectionViewSection(),
    //        TitleCollectionViewSection(),
    //        ListCollectionViewSection(),
    //    ]

    var sections = ExploreViewModel().sections

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(UINib(nibName: ExtraLargeCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ExtraLargeCell.reuseIdentifier)
        collectionView.register(UINib(nibName: SmallCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SmallCell.reuseIdentifier)
        collectionView.register(UINib(nibName: SectionTitleCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: SectionTitleCell.reuseIdentifier)
        collectionView.register(UINib(nibName: ListCell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ListCell.reuseIdentifier)

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

extension ExploreViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sections[indexPath.section].getConfiguredCell(collectionView: collectionView, indexPath: indexPath)
    }
}

extension ExploreViewController: UICollectionViewDelegate {}
