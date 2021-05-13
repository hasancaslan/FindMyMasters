import IGListKit
import UIKit

final class FeaturedCell: UICollectionViewCell, ConfigurableCell, ListBindable {
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIView!
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnailView.layer.cornerRadius = 13
    }

    func configure(_ viewModel: FeaturedItemViewModel) {
        captionLabel.text = viewModel.caption
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        thumbnailImageView.image = viewModel.thumbnail
    }

    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? DataType else { return }
        configure(viewModel)
    }
}
