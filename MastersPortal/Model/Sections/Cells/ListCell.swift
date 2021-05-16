import IGListKit
import UIKit

final class ListCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconView.layer.cornerRadius = 20
    }

    func configure(_ viewModel: CountryItemViewModel) {
        titleLabel.text = viewModel.title
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
