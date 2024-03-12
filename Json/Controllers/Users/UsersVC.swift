import UIKit

final class UsersVC: UIViewController {
    
    // MARK: - Properties
    // MARK: Public
    public let usersTableView: UITableView = UITableView()
    // MARK: Private
    private var info: [Users] = [] {
        didSet {
            usersTableView.reloadData()
        }
    }
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        addSubviews()
        setupUsersTableView()
        addConstraints()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NetworkManager.instance.getAllUsers { data in
            self.info = data
        }
    }
    
    // MARK: - API
    // MARK: - Setups
    
    private func addSubviews() {
        view.addSubview(usersTableView)
    }
    
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
        usersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        usersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
    }
}
// MARK: - Helpers

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as? UsersTableViewCell {
            cell.set(info[indexPath.row].name ?? "",
                     info[indexPath.row].email ?? "")
            return cell
        }
        
        return UITableViewCell()
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
}
