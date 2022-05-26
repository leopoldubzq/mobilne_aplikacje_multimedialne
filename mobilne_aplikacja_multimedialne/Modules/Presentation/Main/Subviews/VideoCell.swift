import UIKit

class VideoCell: UITableViewCell {
    
    // MARK: PUBLIC PROPERTIES
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        label.textColor = .label
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: INITIALIZERS
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: OVERRIDDEN FUNCTIONS
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.1) { [weak self] in
                guard let self = self else { return }
                self.videoTitleLabel.alpha = self.isHighlighted ? 0.5 : 1
            }
        }
    }
    
    // MARK: PUBLIC FUNCTIONS
    
    func configure(videoTitle: String) {
        videoTitleLabel.text = videoTitle
    }
    
    // MARK: LAYOUT
    
    private func setupUI() {
        contentView.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
    }
    
    private func addSubviews() {
        contentView.addSubview(videoTitleLabel)
    }
    
    private func setupConstraints() {
        videoTitleLabel.snp.makeConstraints {
            let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            $0.edges.equalToSuperview().inset(insets)
        }
    }
}
