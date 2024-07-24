import UIKit

final class UsersInfoVC: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public var usersInfo: Users
    // MARK: Private
    private let userInfoLabel: UILabel = UILabel()
    private let closeButton: UIButton = UIButton()
    
    internal init(user: Users) {
        self.usersInfo = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
//        addConstraints()
        view.backgroundColor = .red
    }
    // MARK: - API
    // MARK: - Setups
    private func addSubviews() {
        view.addAllSubviews(userInfoLabel,
                            closeButton)
    }
    
    private func addConstraints() {
        userInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupUI() {
        // userInfoLabel
        userInfoLabel.backgroundColor = .white
        userInfoLabel.text =
        """
        User: \(usersInfo.id)
        Username: \(usersInfo.username)
        Address: \(Address(street: usersInfo.address.street ,
                            suite: usersInfo.address.suite,
                            city: usersInfo.address.city,
                            zipcode: usersInfo.address.zipcode,
                            geo: Geo(lat: usersInfo.address.geo.lat,
                            lng: usersInfo.address.geo.lng)))
        Company: \(Company(name: usersInfo.company.name,
                            catchPhrase: usersInfo.company.catchPhrase,
                            bs: usersInfo.company.bs))
        """
        userInfoLabel.font = .systemFont(ofSize: 22, weight: .regular)
        userInfoLabel.textAlignment = .left
        userInfoLabel.frame = CGRect(x: 25, y: 100, width: 335, height: 250)
        userInfoLabel.numberOfLines = 0
//        userInfoLabel.lineBreakMode = .byWordWrapping
        userInfoLabel.layer.borderWidth = 1
        userInfoLabel.layer.borderColor = UIColor.lightGray.cgColor
        
        // closeButton
        closeButton.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.91, alpha: 1)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.frame = CGRect(x: 120, y: 420, width: 170, height: 45)
        closeButton.layer.cornerRadius = 5
        closeButton.addTarget(self, action: #selector(closeButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonDidTapped() {
        dismiss(animated: true)
    }
}

