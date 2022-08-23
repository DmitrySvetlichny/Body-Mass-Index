import UIKit

class HistoryCell: UITableViewCell {
    
    var resultLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        lable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        lable.textAlignment = .left
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var dataLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        lable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        lable.textAlignment = .center
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var nameLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "MarkerFelt-Wide", size: 25)
        lable.textColor = UIColor(red: 105/256, green: 48/256, blue: 195/256, alpha: 1)
        lable.textAlignment = .left
        lable.numberOfLines = 0
        lable.adjustsFontSizeToFitWidth = true
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellView() {
        
        contentView.addSubview(nameLable)
        contentView.addSubview(resultLable)
        contentView.addSubview(dataLable)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameLable.heightAnchor.constraint(equalToConstant: 55),
            nameLable.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            resultLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            resultLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            resultLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            resultLable.leadingAnchor.constraint(equalTo: nameLable.trailingAnchor),
            resultLable.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            dataLable.leadingAnchor.constraint(equalTo: resultLable.trailingAnchor),
            dataLable.topAnchor.constraint(equalTo: contentView.topAnchor),
            dataLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dataLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
