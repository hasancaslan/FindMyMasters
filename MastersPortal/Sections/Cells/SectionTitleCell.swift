import IGListKit
import UIKit

final class SectionTitleCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var navigationLabel: UILabel!

    var showsNavigationLabel = true {
        didSet {
            navigationLabel.isHidden = !showsNavigationLabel
        }
    }

    func configure(_ viewModel: SectionTitleViewModel) {
        titleLabel.text = viewModel.title
        navigationLabel.text = viewModel.navigationTitle
        showsNavigationLabel = viewModel.navigationTitle != nil
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
