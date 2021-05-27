//
//  StretchyCollectionViewFlowLayout.swift
//  MastersPortal
//
//  Created by HASAN CAN on 15/5/21.
//

import UIKit

class StretchyCollectionViewFlowLayout: UICollectionViewCompositionalLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)

        layoutAttributes?.forEach { attribute in
            if attribute.indexPath.section == 0 {
                guard let collectionView = collectionView else { return }
                let contentOffsetY = collectionView.contentOffset.y

                if contentOffsetY < 0 {
                    let width = collectionView.frame.width
                    let height = attribute.frame.height - contentOffsetY
                    attribute.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                }
            }
        }

        return layoutAttributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
