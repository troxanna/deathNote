//
//  NoteView.swift
//  deathNote
//
//  Created by Anastasia Nevodchikova on 08.07.2023.
//

import UIKit
import SnapKit

class NoteView: UIView {
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 40
        sv.alignment = .center
        return sv
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.textAlignment = .center
        tf.placeholder = "Name..."
        tf.keyboardType = UIKeyboardType.default
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    let descriptionTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .black
        tf.borderStyle = .line
        return tf
    }()
    
    let deathDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        return datePicker
    }()

    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NoteView {
    func setup() {
        self.addSubview(imageView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(nameTextField)
        stackView.addArrangedSubview(deathDatePicker)
        stackView.addArrangedSubview(descriptionTextField)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(self.snp.left).inset(36)
            make.right.equalTo(self.snp.right).inset(36)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        nameTextField.snp.makeConstraints { make in
            make.width.equalTo(stackView.snp.width)
        }
        
        descriptionTextField.snp.makeConstraints { make in
            make.height.equalTo(140)
            make.width.equalTo(stackView.snp.width)
        }
    }
    
    func setData() {
        
    }
    
//    func addTarget(self, action) {
//        
//    }
}
