import IGListKit
import UIKit

final class FeaturedCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet var captionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var thumbnailView: UIView!
    @IBOutlet var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 13
    }

    func configure(_ viewModel: FeaturedItemViewModel) {
        captionLabel.text = viewModel.caption.capitalized
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        thumbnailImageView.image = viewModel.thumbnail
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
