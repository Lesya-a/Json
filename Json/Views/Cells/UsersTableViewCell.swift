import UIKit

final class UsersTableViewCell: UITableViewCell {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let userNameInfo = UILabel()
    //private let emailInfo = UILabel()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    // MARK: - API
    
    // MARK: - Setups
    private func addSubviews() {
        contentView.addSubview(userNameInfo)
    }
    
    private func setupConstraints() {
        userNameInfo.translatesAutoresizingMaskIntoConstraints = false
        userNameInfo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        userNameInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        userNameInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        userNameInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        userNameInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupUI() {
        userNameInfo.text = "Test)"
        userNameInfo.font = .systemFont(ofSize: 21, weight: .medium)
        userNameInfo.textAlignment = .center
    }
    // MARK: - Helpers
}
