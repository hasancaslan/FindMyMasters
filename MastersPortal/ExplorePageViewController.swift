//
//  ExplorePageViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 7/6/21.
//

import IGListKit
import UIKit

class ExplorePageViewController: UIViewController {
    var dataSource: SectionsDataSource

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground

        return collectionView
    }()

    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            self.dataSource.layout(at: sectionIndex)
        }

        return layout
    }()

    lazy var adapter: ListAdapter = {
        let adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
        return adapter
    }()

    init(title: String, dataSource: SectionsDataSource) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.configureNavigationBar()
        navigationItem.title = L10n.Explore.Navigation.title

        addCollectionView()

        adapter.collectionView = collectionView
        adapter.dataSource = dataSource
    }

    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        view.constrainToEdges(collectionView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }

    func scrollViewDidScroll(_: UIScrollView) {
        if #available(iOS 13.0, *) {
            // Workaround for incorrect initial offset by `.groupPagingCentered`
            collectionView.reloadData()
        }
    }
}
