import UIKit

class CalculateViewController: UIViewController {
    
    let name: String
    
    var items = [ItemCalculate]()
    
    var mainNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        label.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var massTextField: UITextField = {
        let mass = UITextField()
        mass.layer.cornerRadius = 25
        mass.layer.borderWidth = 1
        mass.layer.borderColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1).cgColor
        mass.textColor = .systemBlue
        mass.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        mass.setLeftIcon(UIImage(named: "weight")!)
        mass.backgroundColor = .white
        mass.clearButtonMode = .whileEditing
        mass.translatesAutoresizingMaskIntoConstraints = false
        mass.keyboardType = .numbersAndPunctuation
        mass.placeholder = "Ваш вес (kg)"
        return mass
    }()
    
    var heightTextField: UITextField = {
        let height = UITextField()
        height.layer.cornerRadius = 25
        height.layer.borderWidth = 1
        height.layer.borderColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1).cgColor
        height.textColor = .systemBlue
        height.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        height.setLeftIcon(UIImage(named: "height")!)
        height.backgroundColor = .white
        height.clearButtonMode = .whileEditing
        height.translatesAutoresizingMaskIntoConstraints = false
        height.keyboardType = .numbersAndPunctuation
        height.placeholder = "Ваш рост (cm)"
        return height
    }()
    
    var stackTextField: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 25
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 50
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.backgroundColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("РАСЧЁТ", for: .normal)
        button.setTitleColor(UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 50)
        return button
    }()
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCalculateViewController()
        setupConstraintsCalc()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        let isDark = userDef.bool(forKey: "isDark")
        let isKG = userDef.bool(forKey: "isKG")
        
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
            
            mainNameLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            massTextField.backgroundColor = UIColor(red: 202/256, green: 240/256, blue: 248/256, alpha: 1)
            heightTextField.backgroundColor = UIColor(red: 202/256, green: 240/256, blue: 248/256, alpha: 1)
            calculateButton.layer.borderColor = UIColor(red: 202/256, green: 240/256, blue: 248/256, alpha: 1).cgColor
            calculateButton.backgroundColor = UIColor(red: 90/256, green: 24/256, blue: 154/256, alpha: 1)
            calculateButton.setTitleColor(UIColor(red: 0/256, green: 150/256, blue: 199/256, alpha: 1), for: .normal)
        } else {
            view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            
            mainNameLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            massTextField.backgroundColor = .white
            heightTextField.backgroundColor = .white
            calculateButton.layer.borderColor = UIColor.white.cgColor
            calculateButton.setTitleColor(UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1), for: .normal)
            calculateButton.backgroundColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        }
        
        navigationItem.backButtonTitle = "Расчёт"
        if isRU == false {
            navigationItem.backButtonTitle = "Calculation"
        }
        
        let item = UIBarButtonItem(title: "Очистить", style: .plain, target: self, action: #selector(cencelTextFields))
        navigationItem.rightBarButtonItem = item
        if isRU == false {
            item.title = "Clear"
        }
        
        let itemOut = UIBarButtonItem(title: "Выйти", style: .plain, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = itemOut
        if isRU == false {
            itemOut.title = "Exit"
        }
        
        if isKG == false {
            massTextField.placeholder = "Ваш вес (lb)"
            heightTextField.placeholder = "Ваш рост (in)"
            if isRU == false {
                massTextField.placeholder = "Your weight (lb)"
                heightTextField.placeholder = "Your height (in)"
            }
        } else {
            massTextField.placeholder = "Ваш вес (kg)"
            heightTextField.placeholder = "Ваш рост (cm)"
            if isRU == false {
                massTextField.placeholder = "Your weight (kg)"
                heightTextField.placeholder = "Your height (cm)"
            }
        }
        
        if isRU == false {
            mainNameLabel.text = "\(name), Let's calculate Your body mass index!"
        } else {
            mainNameLabel.text = "\(name), давайте рассчитаем индекс массы Вашего тела!"
        }
        if isRU == false {
            calculateButton.setTitle("CALCULATION", for: .normal)
            calculateButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        } else {
            calculateButton.setTitle("РАСЧЁТ", for: .normal)
            calculateButton.titleLabel?.font = UIFont(name: "MarkerFelt-Wide", size: 50)
        }
    }
    
    func setupCalculateViewController() {
        
        view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        
        mainNameLabel.text = "\(name), давайте рассчитаем индекс массы Вашего тела!"
        view.addSubview(mainNameLabel)
        
        stackTextField.addArrangedSubview(massTextField)
        stackTextField.addArrangedSubview(heightTextField)
        view.addSubview(stackTextField)
        
        massTextField.delegate = self
        heightTextField.delegate = self
        
        view.addSubview(calculateButton)
        calculateButton.addTarget(self, action: #selector(startCalculation), for: .touchUpInside)
    }
    
    func setupConstraintsCalc() {
        
        NSLayoutConstraint.activate([
            mainNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            mainNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackTextField.topAnchor.constraint(lessThanOrEqualTo: mainNameLabel.bottomAnchor, constant: 105),
            stackTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            stackTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            massTextField.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: stackTextField.bottomAnchor, constant: 75),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 100),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc
    func startCalculation() {
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        
        let calculatStruct = IndexCalculate()
        
        guard let masstext = massTextField.text, let floatMassText = Float(masstext) else {
            massTextField.text = ""
            massTextField.placeholder = "Укажите Ваш Вес!"
            if isRU == false {
                massTextField.placeholder = "Enter Your Weight!"
            }
            return }
        
        guard let heigtext = heightTextField.text, let floatHeigText = Float(heigtext) else {
            heightTextField.text = ""
            heightTextField.placeholder = "Укажите Ваш Рост!"
            if isRU == false {
                heightTextField.placeholder = "Enter Your Height!"
            }
            return }
        
        let result = calculatStruct.calculation(mass: floatMassText, heig: floatHeigText)
        let calculateResult = ResultViewController(result: result)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        
        let item = ItemCalculate(name: name, result: String(format: "%.2f",result), date: dateString)
        items.append(item)
        
        guard let vcs = tabBarController?.viewControllers else { return }
        guard let navVC = vcs[1] as? UINavigationController else { return }
        guard let historyVC = navVC.viewControllers[0] as? HistoryViewController else { return }
        
        historyVC.items = items
        historyVC.tabelHistory.reloadData()
        historyVC.isSorted = false
        
        navigationController?.pushViewController(calculateResult, animated: true)
    }
    
    @objc
    func logOut() {
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        
        let alert = UIAlertController(title: "Предупреждение!", message: "Вы точно хотите выйти?", preferredStyle: .alert)
        
        if isRU == false {
            alert.title = "Warning!"
            alert.message = "Your definitely want to exit"
        }
        
        if isRU == false {
            let yes = UIAlertAction(title: "Yes", style: .destructive) { action in
                let logVC = LoginViewController()
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {fatalError()}
                sceneDelegate.window?.rootViewController = logVC
                
                userDef.set(false, forKey: "isLogIn")
                userDef.set(false, forKey: "isDark")
                userDef.set(true, forKey: "isKG")
                userDef.removeObject(forKey: "name")
            }
            alert.addAction(yes)
        } else {
            let yes = UIAlertAction(title: "Да", style: .destructive) { action in
                let logVC = LoginViewController()
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {fatalError()}
                sceneDelegate.window?.rootViewController = logVC
                
                userDef.set(false, forKey: "isLogIn")
                userDef.set(false, forKey: "isDark")
                userDef.set(true, forKey: "isKG")
                userDef.removeObject(forKey: "name")
            }
            alert.addAction(yes)
        }
        
        var cancel: UIAlertAction {
            var cencel1 = UIAlertAction()
            if isRU == false {
                cencel1 = UIAlertAction(title: "Cancel", style: .cancel)
            } else {
                cencel1 = UIAlertAction(title: "Отмена", style: .cancel)
            }
            return cencel1
        }
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @objc
    func cencelTextFields() {
        massTextField.text = ""
        heightTextField.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        massTextField.text = ""
        heightTextField.text = ""
    }
}

extension CalculateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        massTextField.resignFirstResponder()
        heightTextField.resignFirstResponder()
        return true
    }
}
