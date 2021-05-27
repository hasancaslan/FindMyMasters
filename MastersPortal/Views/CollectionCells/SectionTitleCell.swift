import IGListKit
import UIKit

protocol SectionTitleCellDelegate: AnyObject {
    func didTapNavigation(cell: SectionTitleCell)
}

final class SectionTitleCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet var navigationButton: UIButton!

    weak var delegate: SectionTitleCellDelegate?

    var showsNavigationLabel = true {
        didSet {
            navigationButton.isHidden = !showsNavigationLabel
        }
    }

    @IBAction func onNavigation(_: Any) {
        delegate?.didTapNavigation(cell: self)
    }

    func configure(_ viewModel: SectionTitleViewModel) {
        titleLabel.text = viewModel.title
        navigationButton.setTitle(viewModel.navigationTitle, for: .normal)
        showsNavigationLabel = viewModel.navigationTitle != nil
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
