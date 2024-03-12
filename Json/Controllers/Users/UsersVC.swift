import UIKit

final class UsersVC: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public let usersTableView: UITableView = UITableView()
    // MARK: Private
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        view.addSubview(usersTableView)
        setupUsersTableView()
        addConstraints()
    }
    
    // MARK: - API
    // MARK: - Setups
    
    private func setupUsersTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.rowHeight = UITableView.automaticDimension
        usersTableView.separatorStyle = .singleLine
        usersTableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "UsersTableViewCell")
    }
    
    private func addConstraints() {
        usersTableView.translatesAutoresizingMaskIntoConstraints = false
        usersTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        usersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
// MARK: - Helpers

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        21
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath)
            as? UsersTableViewCell {
            return cell
        }
        return UITableViewCell()
    }
}
