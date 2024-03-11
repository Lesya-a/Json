import UIKit

class MainTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    // MARK: Public
    
    // MARK: Private
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    // MARK: - API
    // MARK: - Setups
    // MARK: - Helpers
        
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: UsersVC(),
                title: "Users",
                image: UIImage(systemName: "chart.bar.doc.horizontal.fill")),
            generateVC(
                viewController: ToDoVC(),
                title: "ToDo",
                image: UIImage(systemName: "rectangle.and.pencil.and.ellipsis"))
        ]
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let beziePath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width, height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = beziePath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.mainWhite.cgColor
        
        tabBar.tintColor = .tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }

}
