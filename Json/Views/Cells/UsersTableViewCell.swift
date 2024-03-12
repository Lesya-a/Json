import UIKit

final class UsersTableViewCell: UITableViewCell {
    // MARK: - Properties
    // MARK: Public
    // MARK: Private
    private let userNameInfo = UILabel()
    private let emailInfo = UILabel()
    
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
    func set(_ name: String, _ email: String) {
        userNameInfo.text = name
        emailInfo.text = email
    }
    
    // MARK: - Setups
    private func addSubviews() {
        contentView.addAllSubviews(
            userNameInfo,
            emailInfo
        )
    }
    
    private func setupConstraints() {
        //userNameInfo
        userNameInfo.translatesAutoresizingMaskIntoConstraints = false
        userNameInfo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        userNameInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        userNameInfo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        userNameInfo.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 30).isActive = true
        userNameInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //emailInfo
        emailInfo.translatesAutoresizingMaskIntoConstraints = false
        emailInfo.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        emailInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        emailInfo.leadingAnchor.constraint(equalTo: userNameInfo.trailingAnchor).isActive = true
        emailInfo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        emailInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    private func setupUI() {
        userNameInfo.backgroundColor = .red
        userNameInfo.text = "Test)"
        userNameInfo.font = .systemFont(ofSize: 21, weight: .medium)
        userNameInfo.textAlignment = .left
        
        emailInfo.backgroundColor = .blue
        emailInfo.text = "E-mail"
        emailInfo.font = .systemFont(ofSize: 20, weight: .light)
        emailInfo.textAlignment = .right
    }
    // MARK: - Helpers
}
