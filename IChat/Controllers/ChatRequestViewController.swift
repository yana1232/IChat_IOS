//
//  ChatRequestViewController.swift
//  IChat
//
//  Created by Яна Балковская on 5.09.22.
//

import UIKit

class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human1") , contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Ban", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the opportunity to start a new chat", font: .systemFont(ofSize: 16, weight: .light))
    let acceptButton = UIButton(title: "ACCEPT", titleColor: .white, backgroundColor: .black, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "DENY", titleColor: #colorLiteral(red: 0.8756850362, green: 0.2895075083, blue: 0.2576965988, alpha: 1), backgroundColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainWhite()
        setupConstraints()
        customizeElements()
    }
    
    private func customizeElements() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8756850362, green: 0.2895075083, blue: 0.2576965988, alpha: 1)
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.acceptButton.applyGradients(cornerRadius: 10)

    }
}

extension ChatRequestViewController {
    private func setupConstraints() {
        view.addSubview(imageView)
        view.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(aboutMeLabel)
        
        let buttomsStackView = UIStackView(arrangedSubviews: [acceptButton, denyButton], axis: .horizontal, spacing: 7)
        buttomsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomsStackView.distribution = .fillEqually
        containerView.addSubview(buttomsStackView)

        NSLayoutConstraint.activate([
         imageView.topAnchor .constraint(equalTo: view.topAnchor),
         imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         imageView.bottomAnchor.constraint(equalTo:  containerView.topAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 206)
        ])
        
        NSLayoutConstraint.activate([
         nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 35),
         nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
         nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
         aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
         aboutMeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
         aboutMeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            buttomsStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
            buttomsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            buttomsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            buttomsStackView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
 
// MARK: - SwiftUI
import SwiftUI

struct ChatRequestVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let sighUpVC = ChatRequestViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) -> ChatRequestViewController {
            return sighUpVC
        }
        
        func updateUIViewController(_ uiViewController: ChatRequestVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ChatRequestVCProvider.ContainerView>) {
            
        }
    }
}
