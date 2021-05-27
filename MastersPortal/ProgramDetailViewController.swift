//
//  ProgramDetailViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 15/5/21.
//

import IGListKit

class ProgramDetailViewController: UIViewController {
    let padding: CGFloat = 20
    private var headerView: StretchyHeaderView?
    let viewModel: ListAdapterViewModel = SimpleListAdapterViewModel(MockDetailViewModel().sections)

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground

        collectionView.register(
            StretchyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderView.reuseIdentifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.sectionInset = .init(top: 0, left: 20, bottom: 20, right: 20)
        }

        collectionView.dataSource = self
        collectionView.delegate = self

        return collectionView
    }()

    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = StretchyCollectionViewFlowLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            var section = self.viewModel.layout(at: sectionIndex)
            if sectionIndex == 0 {
                let headerItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100))
                let headerItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerItemSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section?.boundarySupplementaryItems = [headerItem]
            }

            return section
        }

        return layout
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
    }

    private func addCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ProgramDetailViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        30
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.reuseIdentifier, for: indexPath)
                as? StretchyHeaderView
        else { fatalError() }
        header.configure(Asset.DemoImages.kuCyber.image)
        headerView = header
        return header
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //        if indexPath.item == 0 {
        //            return collectionView.dequeueReusableCell(withReuseIdentifier: QuickFactCell.reuseIdentifier, for: indexPath)
        //        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}

extension ProgramDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        CGSize(width: view.frame.width - 2 * padding, height: 44)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 340)
    }
}

// MARK: - UIScrollViewDelegate

extension ProgramDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY < -padding {
            headerView?.animator.fractionComplete = abs(contentOffsetY) / 200
        } else {
            headerView?.animator.fractionComplete = 0.0
        }
    }
}
