import UIKit

class InfoViewController: UIViewController {
    
    var infoLable: UILabel = {
        let main = UILabel()
        main.text = "ИНДЕКСЫ МАССЫ ТЕЛА:"
        main.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        main.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        main.textAlignment = .center
        main.numberOfLines = 2
        main.translatesAutoresizingMaskIntoConstraints = false
        return main
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInfoVC()
        setupInfoConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        let isDark = userDef.bool(forKey: "isDark")
        navigationItem.title = "ИНФО"
        if isRU == false {
            navigationItem.title = "INFO"
            infoLable.text = "BODY MASS INDEXES:"
            imageVievInfo.image = UIImage(named: "indexes")
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
            infoLable.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
        } else {
            view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            infoLable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        }
    }
    
    func setupInfoVC() {
        view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        view.addSubview(infoLable)
        view.addSubview(imageVievInfo)
    }
    
    func setupInfoConstraints() {
        NSLayoutConstraint.activate([
            infoLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            infoLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            infoLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
        ])
        NSLayoutConstraint.activate([
            imageVievInfo.topAnchor.constraint(equalTo: infoLable.topAnchor, constant: 200),
            imageVievInfo.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 15),
            imageVievInfo.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            imageVievInfo.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            imageVievInfo.heightAnchor.constraint(equalToConstant: 220),
        ])
    }
}
