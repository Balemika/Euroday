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
    let countryName = "Italy"
    var imageView = UIImageView()
    var button = UIButton()
    
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
        
        
        textLabel.text = textHeader + countryName
        textLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
        textLabel.set(textColor: .systemBlue, range: NSMakeRange(textHeader.count, countryName.count))
        
        
        imageView.image = UIImage(named: "placeholder-light")
        
        
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -180),
  
            
            imageView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 100),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
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
