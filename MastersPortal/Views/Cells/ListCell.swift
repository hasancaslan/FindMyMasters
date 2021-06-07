import IGListKit
import UIKit

final class ListCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet private var iconView: UIView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(_ viewModel: CountryItemViewModel) {
        titleLabel.text = viewModel.title
        imageView.image = viewModel.icon
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
