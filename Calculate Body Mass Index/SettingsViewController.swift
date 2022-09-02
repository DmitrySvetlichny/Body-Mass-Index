import UIKit

class SettingsViewController: UIViewController {
    
    var measuresImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "metr"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var measuresLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        label.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        label.text = "Единицы величин"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var measuresSegmented: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["kg/cm", "lb/in"])
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
        segment.selectedSegmentTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    var langImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "lang"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var langLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        label.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        label.text = "Язык"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var langSegmented: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["RU", "ENG"])
        segment.selectedSegmentIndex = 0
        segment.backgroundColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
        segment.selectedSegmentTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    var themeImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "color"))
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var themeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        label.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        label.text = "Темная тема"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var themeSwitch: UISwitch = {
        let switcher = UISwitch()
        switcher.onTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        switcher.thumbTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.backgroundColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
        switcher.layer.cornerRadius = 16
        return switcher
    }()
    
    var imageStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 50
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var lableStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 50
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 60
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingVC()
        setupConstraintsSettingVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDef = UserDefaults.standard
        let isDark = userDef.bool(forKey: "isDark")
        let isRU = userDef.bool(forKey: "isRU")
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 128/256, green: 255/256, blue: 219/256, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.tintColor = UIColor.blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        if isDark == true {
            view.backgroundColor = UIColor(red: 0/256, green: 150/256, blue: 199/256, alpha: 1)
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 72/256, green: 202/256, blue: 228/256, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)]
            navigationController?.navigationBar.tintColor = UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            tabBarController?.tabBar.backgroundColor = UIColor(red: 72/256, green: 202/256, blue: 228/256, alpha: 1)
            tabBarController?.tabBar.tintColor = UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)
            themeSwitch.onTintColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
            measuresLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            langLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            themeLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            measuresSegmented.selectedSegmentTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            langSegmented.selectedSegmentTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            themeSwitch.thumbTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            measuresSegmented.backgroundColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            langSegmented.backgroundColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            themeSwitch.onTintColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
        }
        
        if isRU == false {
            measuresLabel.text = "Units of measures"
            langLabel.text = "Language"
            themeLabel.text = "Dark theme"
        }
    }
    
    func setupSettingVC() {
        let userDef = UserDefaults.standard
        let isKG = userDef.bool(forKey: "isKG")
        let isRU = userDef.bool(forKey: "isRU")
        let isDark = userDef.bool(forKey: "isDark")
        
        view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        imageStack.addArrangedSubview(measuresImage)
        imageStack.addArrangedSubview(langImage)
        imageStack.addArrangedSubview(themeImage)
        view.addSubview(imageStack)
        lableStack.addArrangedSubview(measuresLabel)
        lableStack.addArrangedSubview(langLabel)
        lableStack.addArrangedSubview(themeLabel)
        view.addSubview(lableStack)
        buttonStack.addArrangedSubview(measuresSegmented)
        buttonStack.addArrangedSubview(langSegmented)
        view.addSubview(buttonStack)
        view.addSubview(themeSwitch)
        
        measuresSegmented.addTarget(self, action: #selector(converted(sender:)), for: .valueChanged)
        if isKG == true {
            measuresSegmented.selectedSegmentIndex = 0
        } else {
            measuresSegmented.selectedSegmentIndex = 1
        }
        
        langSegmented.addTarget(self, action: #selector(language(sender:)), for: .valueChanged)
        if isRU == true {
            langSegmented.selectedSegmentIndex = 0
        } else {
            langSegmented.selectedSegmentIndex = 1
        }
        
        themeSwitch.addTarget(self, action: #selector(darkTheme(sender:)), for: .valueChanged)
        if isDark == true {
            themeSwitch.isOn = true
        } else {
            themeSwitch.isOn = false
        }
    }
    
    func setupConstraintsSettingVC() {
        NSLayoutConstraint.activate([
            imageStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageStack.widthAnchor.constraint(equalToConstant: 50),
            measuresImage.heightAnchor.constraint(equalToConstant: 45),
        ])
        NSLayoutConstraint.activate([
            lableStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            lableStack.leadingAnchor.constraint(equalTo: imageStack.trailingAnchor, constant: 5),
            lableStack.heightAnchor.constraint(equalTo: imageStack.heightAnchor),
        ])
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            buttonStack.leadingAnchor.constraint(equalTo: lableStack.trailingAnchor, constant: 5),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            measuresSegmented.heightAnchor.constraint(equalToConstant: 35),
            measuresSegmented.topAnchor.constraint(equalTo: buttonStack.topAnchor, constant: 5),
            langSegmented.heightAnchor.constraint(equalToConstant: 35),
        ])
        NSLayoutConstraint.activate([
            themeSwitch.leadingAnchor.constraint(equalTo: lableStack.trailingAnchor, constant: 5),
            themeSwitch.topAnchor.constraint(equalTo: buttonStack.bottomAnchor, constant: 64),
        ])
    }
    
    @objc
    func converted(sender: UISegmentedControl) {
        let userDef = UserDefaults.standard
        
        switch sender.selectedSegmentIndex {
        case 0:
            userDef.set(true, forKey: "isKG")
        case 1:
            userDef.set(false, forKey: "isKG")
        default:
            return
        }
    }
    
    @objc
    func language(sender: UISegmentedControl) {
        guard let vcs = self.tabBarController?.viewControllers else { return }
        guard let navVC = vcs[0] as? UINavigationController else { return }
        guard let calculVC = navVC.viewControllers[0] as? CalculateViewController else { return }
        guard let navVC1 = vcs[1] as? UINavigationController else { return }
        guard let historVC = navVC1.viewControllers[0] as? HistoryViewController else { return }
        
        let userDef = UserDefaults.standard
        
        switch sender.selectedSegmentIndex {
        case 0:
            userDef.set(true, forKey: "isRU")
            calculVC.title = "КАЛЬКУЛЯТОР"
            calculVC.calculateButton.setTitle("РАСЧЁТ", for: .normal)
            calculVC.calculateButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 50)
            calculVC.navigationItem.backButtonTitle = "Калькулятор"
            historVC.title = "ИСТОРИЯ"
            historVC.navigationItem.backButtonTitle = "История"
            title = "НАСТРОЙКИ"
            measuresLabel.text = "Единицы величин"
            langLabel.text = "Язык"
            themeLabel.text = "Темная тема"
        case 1:
            userDef.set(false, forKey: "isRU")
            calculVC.title = "CALCULATION"
            calculVC.calculateButton.setTitle("CALCULATION", for: .normal)
            calculVC.calculateButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
            calculVC.navigationItem.backButtonTitle = "Calculation"
            historVC.title = "HISTORY"
            historVC.navigationItem.backButtonTitle = "History"
            title = "SETTINGS"
            measuresLabel.text = "Units of measures"
            langLabel.text = "Language"
            themeLabel.text = "Dark theme"
        default:
            return
        }
    }
    
    @objc
    func darkTheme(sender: UISwitch) {
        let userDef = UserDefaults.standard
        
        if sender.isOn {
            userDef.set(true, forKey: "isDark")
            view.backgroundColor = UIColor(red: 0/256, green: 150/256, blue: 199/256, alpha: 1)
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 72/256, green: 202/256, blue: 228/256, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor: UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)]
            navigationController?.navigationBar.tintColor = UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            tabBarController?.tabBar.backgroundColor = UIColor(red: 72/256, green: 202/256, blue: 228/256, alpha: 1)
            tabBarController?.tabBar.tintColor = UIColor(red: 3/256, green: 4/256, blue: 94/256, alpha: 1)
            measuresSegmented.selectedSegmentTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            langSegmented.selectedSegmentTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            themeSwitch.thumbTintColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            measuresSegmented.backgroundColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            langSegmented.backgroundColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            themeSwitch.onTintColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            measuresLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            langLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            themeLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
        } else {
            userDef.set(false, forKey: "isDark")
            view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(red: 128/256, green: 255/256, blue: 219/256, alpha: 1)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
            navigationController?.navigationBar.tintColor = UIColor.blue
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
            tabBarController?.tabBar.backgroundColor = UIColor(red: 128/256, green: 255/256, blue: 219/256, alpha: 1)
            tabBarController?.tabBar.tintColor = UIColor.blue
            measuresLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            langLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            themeLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            measuresSegmented.selectedSegmentTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            langSegmented.selectedSegmentTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            themeSwitch.thumbTintColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            measuresSegmented.backgroundColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
            langSegmented.backgroundColor = UIColor(red: 114/256, green: 239/256, blue: 221/256, alpha: 1)
        }
    }
}
