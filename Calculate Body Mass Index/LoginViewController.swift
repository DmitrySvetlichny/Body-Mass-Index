import UIKit

class LoginViewController: UIViewController {
    
    var mainLable: UILabel = {
        let main = UILabel()
        main.text = "ИНДЕКС МАССЫ ТЕЛА"
        main.font = UIFont(name: "Futura-CondensedExtraBold", size: 70)
        main.textColor = UIColor(red: 116/256, green: 0/256, blue: 184/256, alpha: 1)
        main.textAlignment = .center
        main.numberOfLines = 0
        main.adjustsFontSizeToFitWidth = true
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
    }()
    
    var nameTextField: UITextField = {
        let name = UITextField()
        name.layer.cornerRadius = 30
        name.layer.borderWidth = 1.5
        name.layer.borderColor = UIColor(red: 116/256, green: 0/256, blue: 184/256, alpha: 1).cgColor
        name.textColor = .systemBlue
        name.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        name.setLeftIcon(UIImage(named: "name")!)
        name.backgroundColor = .white
        name.tintColor = .systemBlue
        name.clearButtonMode = .whileEditing
        name.translatesAutoresizingMaskIntoConstraints = false
        name.placeholder = "Ваше Имя"
        return name
    }()
    
    var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 45
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 116/256, green: 0/256, blue: 184/256, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ВХОД", for: .normal)
        button.setTitleColor(UIColor(red: 72/256, green: 191/256, blue: 227/256, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Futura-CondensedExtraBold", size: 50)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginViewController()
        setupConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        if isRU == false {
            mainLable.text = "BODY MASS INDEX"
            nameTextField.placeholder = "Your Name"
            loginButton.setTitle("LOGIN", for: .normal)
        }
    }
    
    func setupLoginViewController() {
        
        view.backgroundColor = UIColor(red: 72/256, green: 191/256, blue: 227/256, alpha: 1)
        
        view.addSubview(mainLable)
        view.addSubview(nameTextField)
        view.addSubview(loginButton)
        
        nameTextField.delegate = self
        
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    func setupConstraint() {
        
        NSLayoutConstraint.activate([
            mainLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            mainLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            mainLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: mainLable.bottomAnchor, constant: 85),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            nameTextField.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 100),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 100),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc
    func login() {
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        
        if nameTextField.text == "" {
            nameTextField.placeholder = "Укажите Ваше Имя!"
            if isRU == false {
                nameTextField.placeholder = "Enter Your Name!"
            }
        } else {
            let tabBarVC = UITabBarController()
            
            let calculateVC = CalculateViewController(name: nameTextField.text!)
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
            
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {fatalError()}
            sceneDelegate.window?.rootViewController = tabBarVC
            
            userDef.set(true, forKey: "isLogIn")
            userDef.setValue(nameTextField.text, forKey: "name")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

extension UITextField {
    
    func setLeftIcon(_ icon: UIImage) {
        
        let padding = 26
        let size = 30
        
        let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size))
        let iconView  = UIImageView(frame: CGRect(x: padding / 2, y: 0, width: size, height: size))
        iconView.image = icon
        outerView.addSubview(iconView)
        
        leftView = outerView
        leftViewMode = .always
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
}
