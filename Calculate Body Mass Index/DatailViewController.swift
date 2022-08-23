import UIKit

class DatailViewController: UIViewController {
    
    var result: Float
    
    var resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.numberOfLines = 2
        resultLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        resultLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        return resultLabel
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        label.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackResult: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var imageVievInfo: UIImageView = {
        let imageViev = UIImageView()
        imageViev.image = UIImage(named: "www")
        imageViev.contentMode = .scaleToFill
        imageViev.translatesAutoresizingMaskIntoConstraints = false
        imageViev.layer.cornerRadius = 10
        imageViev.layer.borderWidth = 2
        imageViev.layer.borderColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1).cgColor
        imageViev.clipsToBounds = true
        return imageViev
    }()
    
    init(result: Float) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatailVC()
        setupConstraintsDatail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        let isDark = userDef.bool(forKey: "isDark")
        
        navigationItem.title = "ПОДРОБНО"
        if isRU == false {
            navigationItem.title = "DETAIL"
            imageVievInfo.image = UIImage(named: "indexes")
        }
        
        resultLabel.text = "Ваш результат: \(String(format: "%.2f", result))"
        if isRU == false {
            resultLabel.text = "Your result: \(String(format: "%.2f", result))"
        }
        
        descriptionLabel.text = ""
        if result < 16 {
            descriptionLabel.text = """
У Вас ЗНАЧИТЕЛЬНЫЙ ДЕФИЦИТ
массы тела 🥺 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    SEVERELY UNDERWEIGHT 🥺 !
    """
            }
        } else if result >= 16 && result <= 18.49 {
            descriptionLabel.text = """
У Вас ДЕФИЦИТ
массы тела 😕 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    UNDERWEIGHT 😕 !
    """
            }
        } else if result >= 18.5 && result <= 24.99 {
            descriptionLabel.text = """
У Вас НОРМА
массы тела 🤩 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You have NORMAL
    body weight 🤩 !
    """
            }
        } else if result >= 25 && result <= 29.99 {
            descriptionLabel.text = """
У Вас ИЗБЫТОК
массы тела ☹️ !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    OVERWEIGHT ☹️ !
    """
            }
        } else if result >= 30 && result <= 34.99 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ПЕРВОЙ СТЕПЕНИ
массы тела 😧 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    FIRST DEGREE of body mass 😧 !
    """
            }
        } else if result >= 35 && result <= 39.99 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ВТОРОЙ СТЕПЕНИ
массы тела 😫 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    SECOND DEGREE of body mass 😫 !
    """
            }
        } else if result >= 40 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ТРЕТЬЕЙ СТЕПЕНИ
массы тела 😭 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    THIRD DEGREE of body mass 😭 !
    """
            }
        }
        
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
            
            resultLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            descriptionLabel.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
        } else {
            view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            
            resultLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            descriptionLabel.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        }
    }
    
    func setupDatailVC() {
        
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        
        view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        
        resultLabel.text = "Ваш результат: \(String(format: "%.2f", result))"
        if isRU == false {
            resultLabel.text = "Your result: \(String(format: "%.2f", result))"
        }
        
        descriptionLabel.text = ""
        if result < 16 {
            descriptionLabel.text = """
У Вас ЗНАЧИТЕЛЬНЫЙ ДЕФИЦИТ
массы тела 🥺 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    SEVERELY UNDERWEIGHT 🥺 !
    """
            }
        } else if result >= 16 && result <= 18.49 {
            descriptionLabel.text = """
У Вас ДЕФИЦИТ
массы тела 😕 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    UNDERWEIGHT 😕 !
    """
            }
        } else if result >= 18.5 && result <= 24.99 {
            descriptionLabel.text = """
У Вас НОРМА
массы тела 🤩 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You have NORMAL
    body weight 🤩 !
    """
            }
        } else if result >= 25 && result <= 29.99 {
            descriptionLabel.text = """
У Вас ИЗБЫТОК
массы тела ☹️ !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are
    OVERWEIGHT ☹️ !
    """
            }
        } else if result >= 30 && result <= 34.99 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ПЕРВОЙ СТЕПЕНИ
массы тела 😧 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    FIRST DEGREE of body mass 😧 !
    """
            }
        } else if result >= 35 && result <= 39.99 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ВТОРОЙ СТЕПЕНИ
массы тела 😫 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    SECOND DEGREE of body mass 😫 !
    """
            }
        } else if result >= 40 {
            descriptionLabel.text = """
У Вас ОЖИРЕНИЕ ТРЕТЬЕЙ СТЕПЕНИ
массы тела 😭 !
"""
            if isRU == false {
                descriptionLabel.text = """
    You are obese in the
    THIRD DEGREE of body mass 😭 !
    """
            }
        }
        
        view.addSubview(imageVievInfo)
        
        stackResult.addArrangedSubview(resultLabel)
        stackResult.addArrangedSubview(descriptionLabel)
        view.addSubview(stackResult)
    }
    
    func setupConstraintsDatail() {
        
        NSLayoutConstraint.activate([
            stackResult.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackResult.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackResult.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            stackResult.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            imageVievInfo.topAnchor.constraint(equalTo: stackResult.bottomAnchor, constant: 50),
            imageVievInfo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            imageVievInfo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            imageVievInfo.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            imageVievInfo.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
