//
//  EmbeddedCollectionViewCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 13/5/21.
//

import UIKit

class EmbeddedCollectionViewCell<CellType: ConfigurableCell>: UICollectionViewCell {
    lazy var layoutSection: LayoutSection = {
        FeaturedLayoutSection()
    }()

    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { _, _ in
            self.layoutSection.layoutSection()
        }

        return layout
    }()

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: CellType.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CellType.reuseIdentifier)
        return collectionView
    }()

//    lazy var separatorView: UIView = {
//        let separatorView = UIView()
//        separatorView.backgroundColor = .lightGray
//        self.contentView.addSubview(separatorView)
//        return separatorView
//    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
//        separatorView.frame = CGRect(x: 0, y: contentView.bounds.maxY + 0.5, width: contentView.bounds.width, height: 0.5)
    }
}
