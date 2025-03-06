//
//  DetailsView.swift
//  catch-them-all
//
//  Created by Мария Анисович on 05.03.2025.
//

import UIKit

final class DetailsView: UIView {
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont(name: "Lato-Regular", size: 12)
        label.textColor = .black
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .clear
        
        setupStackView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        stackView.addArrangedSubviews([firstLabel, secondLabel, thirdLabel])
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    func addText(firstLabelText: String?, secondLabelText: String?, thirdLabelText: String?) {
        firstLabel.text = firstLabelText
        secondLabel.text = secondLabelText
        thirdLabel.text = thirdLabelText
    }
}
