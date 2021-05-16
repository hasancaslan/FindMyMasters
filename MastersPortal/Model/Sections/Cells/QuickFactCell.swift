//
//  SmallCategoryCell.swift
//  MastersPortal
//
//  Created by HASAN CAN on 16/5/21.
//

import IGListKit

class QuickFactCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!

    func configure(_ viewModel: QuickFactItemViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        iconImageView.image = viewModel.icon
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
