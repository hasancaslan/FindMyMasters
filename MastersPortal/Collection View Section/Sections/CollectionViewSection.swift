//
//  CollectionViewSection.swift
//  MastersPortal
//
//  Created by HASAN CAN on 9/5/21.
//
//
// import UIKit
//
// protocol ConfigurableSection {
//    var numberOfItems: Int { get }
//    func layoutSection() -> NSCollectionLayoutSection
//    func getConfiguredCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
// }
//
// protocol CollectionViewSection: ConfigurableSection {
//    associatedtype DataType
//    associatedtype CellType: ConfigurableCell
//    var data: [DataType] { get set }
// }
//
// extension CollectionViewSection {
//    var numberOfItems: Int {
//        return data.count
//    }
// }
//
// extension CollectionViewSection where CellType.DataType == DataType, CellType: UICollectionViewCell {
//    func getConfiguredCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellType.reuseIdentifier, for: indexPath) as! CellType
//        cell.configure(data[indexPath.item])
//        return cell
//    }
// }
