import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        
        let loginViewController = LoginViewController()
        
        let userDef = UserDefaults.standard
        
        if userDef.bool(forKey: "isLogIn") {
            
            let isRU = userDef.bool(forKey: "isRU")
            
            let tabBarVC = UITabBarController()
            
            let calculateVC = CalculateViewController(name: userDef.string(forKey: "name") ?? "Error")
            calculateVC.title = "РАСЧЁТ"
            if isRU == false {
                calculateVC.title = "CALCULATION"
            }
            calculateVC.tabBarItem.image = UIImage(systemName: "gauge")
            let navigationCalculateVC = UINavigationController(rootViewController: calculateVC)
            
            let historyVC = HistoryViewController()
            historyVC.title = "ИСТОРИЯ"
            if isRU == false {
                historyVC.title = "HISTORY"
            }
            historyVC.tabBarItem.image = UIImage(systemName: "menucard")
            let navigationHistoryVC = UINavigationController(rootViewController: historyVC)
            
            let settingsVC = SettingsViewController()
            settingsVC.title = "НАСТРОЙКИ"
            if isRU == false {
                settingsVC.title = "SETTINGS"
            }
            settingsVC.tabBarItem.image = UIImage(systemName: "gearshape")
            let navigationSettingVC = UINavigationController(rootViewController: settingsVC)
            
            tabBarVC.setViewControllers([navigationCalculateVC, navigationHistoryVC, navigationSettingVC], animated: true)
            tabBarVC.selectedIndex = 0
            tabBarVC.tabBar.backgroundColor = UIColor(red: 128/256, green: 255/256, blue: 219/256, alpha: 1)
            tabBarVC.tabBar.tintColor = UIColor.blue
            
            window.rootViewController = tabBarVC
        } else {
            window.rootViewController = loginViewController
        }
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

