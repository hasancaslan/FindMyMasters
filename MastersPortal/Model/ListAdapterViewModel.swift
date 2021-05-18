//
//  ListAdapterViewModel.swift
//  MastersPortal
//
//  Created by HASAN CAN on 17/5/21.
//

import IGListKit

protocol ListAdapterViewModel: ListAdapterDataSource {
    var sections: [Section] { get set }
    func layout(at index: Int) -> NSCollectionLayoutSection?
}


