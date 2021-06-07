import IGListKit
import UIKit

final class SmallCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var actionButton: UIView!
    @IBOutlet var actionButtonLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 12
        actionButton.layer.cornerRadius = 15
    }

    func configure(_ viewModel: DiciplineItemViewModel) {
        actionButtonLabel.text = viewModel.buttonTitle
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        iconImageView.image = viewModel.icon
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
