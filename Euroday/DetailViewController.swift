//
//  DetailViewController.swift
//  Euroday
//
//  Created by Ņikita Roldugins on 26/02/2022.
//

import UIKit


class DetailViewController: UIViewController {

    // Declaration
    let textLabel = UILabel()
    let textHeader = "Hurray! It is "
    var countryName: String!
    var imageView = UIImageView()
    var button = UIButton()
    var country: Country!
    
    // Screen is loaded and ready to appear
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = .secondarySystemBackground
        let itemsViews: [UIView] = [textLabel,imageView, button]
        let padding: CGFloat = 40
        
        for itemsView in itemsViews {
            view.addSubview(itemsView)
            itemsView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        switch country {
        case .france:
            imageView.image = UIImage(named: "france")
            countryName = "France"
        case .germany:
            imageView.image = UIImage(named: "germany-yellow")
            countryName = "Germany"
        case .finland:
            imageView.image = UIImage(named: "finland")
            countryName = "Finland"
        default:
            break
        }
        
        textLabel.text = textHeader + countryName
        textLabel.numberOfLines = 0
        textLabel.font = UIFont.systemFont(ofSize: 38, weight: UIFont.Weight.bold)
        textLabel.set(textColor: .systemBlue, range: NSMakeRange(textHeader.count, countryName.count))
        
        
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -210),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
  
            
            imageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 40),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -padding),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            button.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    
    @objc private func didTapButton() {
        self.dismiss(animated: true, completion: nil)
    }
}
