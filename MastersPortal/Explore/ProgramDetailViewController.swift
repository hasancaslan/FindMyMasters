//
//  ProgramDetailViewController.swift
//  MastersPortal
//
//  Created by HASAN CAN on 15/5/21.
//

import UIKit

class ProgramDetailViewController: UIViewController {
    let padding: CGFloat = 20
    private var headerView: StretchyHeaderView?

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: StretchyCollectionViewFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInsetAdjustmentBehavior = .never

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(
            StretchyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: StretchyHeaderView.reuseIdentifier
        )
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
        if let layout = collectionView.collectionViewLayout as? StretchyCollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.sectionInset = .init(top: 0, left: 20, bottom: 20, right: 20)
        }

        return collectionView
    }()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ProgramDetailViewController: UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: StretchyHeaderView.reuseIdentifier, for: indexPath) as! StretchyHeaderView
        header.configure(Asset.DemoImages.kuCyber.image)
        headerView = header
        return header
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
}

extension ProgramDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 2 * padding, height: 44)
    }

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, referenceSizeForHeaderInSection _: Int) -> CGSize {
        CGSize(width: view.frame.width, height: 340)
    }
}

// MARK: - UIScrollViewDelegate

extension ProgramDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        print(headerView?.animator.fractionComplete ?? "")
        print(contentOffsetY)
        if contentOffsetY < -padding {
            headerView?.animator.fractionComplete = abs(contentOffsetY) / 200
        } else {
            headerView?.animator.fractionComplete = 0.0
        }
    }
}
