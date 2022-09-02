import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items = [ItemCalculate]()
    var itemsFilt = [ItemCalculate]()
    var itemsSorted = [ItemCalculate]()
    var isSearched = false
    var isSorted = false
    
    var searchHistory: UISearchBar = {
        let search = UISearchBar()
        search.barStyle = .default
        search.tintColor = .systemBlue
        search.showsCancelButton = true
        search.searchBarStyle = .minimal
        search.searchTextField.textColor = .systemBlue
        search.searchTextField.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        search.backgroundColor = UIColor(red: 100/256, green: 223/256, blue: 223/256, alpha: 1)
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    var tabelHistory: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHistoryVC()
        setupHistoryConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        let isDark = userDef.bool(forKey: "isDark")
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 128/256, green: 255/256, blue: 219/256, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.blue]
        navigationController?.navigationBar.tintColor = UIColor.blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        if isDark == true {
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
            searchHistory.backgroundColor = UIColor(red: 0/256, green: 180/256, blue: 216/256, alpha: 1)
            tabelHistory.backgroundColor = UIColor(red: 0/256, green: 150/256, blue: 199/256, alpha: 1)
        } else {
            tabelHistory.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            searchHistory.backgroundColor = UIColor(red: 100/256, green: 223/256, blue: 223/256, alpha: 1)
        }
        
        navigationItem.setRightBarButton(UIBarButtonItem(title: "Очистить", style: .plain, target: self, action: #selector(clearTable)), animated: true)
        navigationItem.setLeftBarButton(UIBarButtonItem(title: "Сортировать", style: .plain, target: self, action: #selector(sortedTable)), animated: true)
        navigationItem.backButtonTitle = "История"
        if isRU == false {
            navigationItem.rightBarButtonItem?.title = "Clear"
            navigationItem.leftBarButtonItem?.title = "Sort"
            navigationItem.backButtonTitle = "History"
        }
        
        tabelHistory.reloadData()
    }
    
    func setupHistoryVC() {
        view.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        searchHistory.delegate = self
        view.addSubview(searchHistory)
        tabelHistory.register(HistoryCell.self, forCellReuseIdentifier: "cell")
        tabelHistory.dataSource = self
        tabelHistory.delegate = self
        view.addSubview(tabelHistory)
    }
    
    func setupHistoryConstraints() {
        NSLayoutConstraint.activate([
            searchHistory.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchHistory.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchHistory.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        NSLayoutConstraint.activate([
            tabelHistory.topAnchor.constraint(equalTo: searchHistory.bottomAnchor),
            tabelHistory.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabelHistory.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabelHistory.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearched == true {
            return itemsFilt.count
        } else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HistoryCell else { return UITableViewCell() }
        
        if isSearched == true {
            cell.resultLable.text = itemsFilt[indexPath.row].result
            cell.dataLable.text = itemsFilt[indexPath.row].date
            cell.nameLable.text = itemsFilt[indexPath.row].name
        } else if isSorted == true {
            cell.resultLable.text = itemsSorted[indexPath.row].result
            cell.dataLable.text = itemsSorted[indexPath.row].date
            cell.nameLable.text = itemsSorted[indexPath.row].name
        } else {
            cell.resultLable.text = items[indexPath.row].result
            cell.dataLable.text = items[indexPath.row].date
            cell.nameLable.text = items[indexPath.row].name
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.systemBlue.cgColor
        
        let userDef = UserDefaults.standard
        let isDark = userDef.bool(forKey: "isDark")
        if isDark == true {
            cell.backgroundColor = UIColor(red: 0/256, green: 150/256, blue: 199/256, alpha: 1)
            cell.resultLable.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            cell.nameLable.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
            cell.dataLable.textColor = UIColor(red: 2/256, green: 62/256, blue: 138/256, alpha: 1)
        } else {
            cell.backgroundColor = UIColor(red: 86/256, green: 207/256, blue: 225/256, alpha: 1)
            cell.resultLable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            cell.nameLable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
            cell.dataLable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        }
        return cell
    }
    
    @objc
    func sortedTable() {
        itemsSorted = items.sorted { Float($0.result)! < Float($1.result)! }
        isSorted = true
        tabelHistory.reloadData()
    }
    
    @objc
    func clearTable() {
        let userDef = UserDefaults.standard
        let isRU = userDef.bool(forKey: "isRU")
        
        let alert = UIAlertController(title: "Предупреждение!", message: "Вы точно хотите очистить историю?", preferredStyle: .actionSheet)
        if isRU == false {
            alert.title = "Warning!"
            alert.message = "You definitely want to clear the history"
        }
        
        if isRU == false {
            let yes = UIAlertAction(title: "Clear", style: .destructive) { action in
                guard let vcs = self.tabBarController?.viewControllers else { return }
                guard let navVC = vcs[0] as? UINavigationController else { return }
                guard let calculVC = navVC.viewControllers[0] as? CalculateViewController else { return }
                calculVC.items.removeAll()
                self.items.removeAll()
                self.itemsFilt.removeAll()
                SceneDelegate.itemsFromData.removeAll()
                let itemsData = try! JSONEncoder().encode(calculVC.items)
                userDef.set(itemsData, forKey: "items")
                self.tabelHistory.reloadData()
            }
            alert.addAction(yes)
        } else {
            let yes = UIAlertAction(title: "Очистить", style: .destructive) { action in
                guard let vcs = self.tabBarController?.viewControllers else { return }
                guard let navVC = vcs[0] as? UINavigationController else { return }
                guard let calculVC = navVC.viewControllers[0] as? CalculateViewController else { return }
                calculVC.items.removeAll()
                self.items.removeAll()
                self.itemsFilt.removeAll()
                let itemsData = try! JSONEncoder().encode(calculVC.items)
                userDef.set(itemsData, forKey: "items")
                self.tabelHistory.reloadData()
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
        
        alert.view
            .subviews.first?
            .subviews.first?
            .subviews.first?
            .backgroundColor = .white
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var datail: String = ""
        if isSearched == true {
            datail = itemsFilt[indexPath.row].result
        } else if isSorted == true {
            datail = itemsSorted[indexPath.row].result
        } else {
            datail = items[indexPath.row].result
        }
        
        let datailFloat = Float(datail)
        let datailVC = DatailViewController(result: datailFloat!)
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.pushViewController(datailVC, animated: true)
    }
}

extension HistoryViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearched = false
        searchHistory.text = ""
        tabelHistory.reloadData()
        searchHistory.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            itemsFilt = items.filter { $0.name.lowercased().uppercased().prefix(searchText.count) == searchText.lowercased().uppercased() }
        }
        
        isSearched = true
        tabelHistory.reloadData()
    }
}
