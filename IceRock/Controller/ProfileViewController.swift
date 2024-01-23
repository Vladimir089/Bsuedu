//
//  ProfileViewController.swift
//  IceRock
//
//  Created by Владимир on 11.01.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    var a = 0
    var viewBotConstraintsTop = NSLayoutConstraint()
    
    let viewBot: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.9608, green: 0.8706, blue: 0.702, alpha: 1.0)
        view.layer.cornerRadius = 40
        return view
    }()
    
    let infoImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "info.circle")
        imageView.image = image
        imageView.tintColor = .systemGray4
        return imageView
    }()
    
    let labelinfo: UILabel = {
        let label = UILabel()
        label.text = "Если вы заблудились в стенах университета и не знаете куда идти - подойдите к работнику университета и покажите ему эту страницу"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .left
        label.textColor = .systemGray4
        label.numberOfLines = 0
        return label
    }()
    
    
    
    let FIOTextField: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = .black
        text.layer.cornerRadius = 10
        return text
    }()
    
    let phoneTextField: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = .black
        text.layer.cornerRadius = 10
        return text
    }()
    
    let groupTextField: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = .black
        text.layer.cornerRadius = 10
        return text
    }()
    
    
    let rukTextField: UITextField = {
        let text = UITextField()
        text.borderStyle = .none
        text.backgroundColor = .white
        text.textColor = .black
        text.layer.cornerRadius = 10
        return text
    }()
    
    

    
    
    let labelFIO: UILabel = {
        let label = UILabel()
        label.text = "Фамилия Имя Отчество"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
    
    let labelGroup: UILabel = {
        let label = UILabel()
        label.text = "Номер группы "
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    let phoneRukovodGroup: UILabel = {
        let label = UILabel()
        label.text = "Номер телефона руководителя "
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        label.numberOfLines = 1
        return label
    }()
    
    
    var labelRukovod: UILabel = {
        let label = UILabel()
        label.text = "Руководитель: "
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textAlignment = .right
        label.numberOfLines = 3
        return label
    }()
    
    let barItem: UIBarButtonItem = {
        let but = UIBarButtonItem()
        but.title = "Редактировать"
        but.tintColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 1)
        return but
    }()
    
    let editImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")
        imageView.tintColor = .white
        return imageView
    }()
    
    let OnProfileImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 1)
        view.layer.cornerRadius = 120
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "person.crop.circle")
        imageView.image = image
        imageView.layer.cornerRadius = 115
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func createBotView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.8235, green: 0.7686, blue: 0.9961, alpha: 1)
        view.layer.cornerRadius = 25
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Профиль"
        editImageView.isHidden = true
        loadProfileImage()
        
        addComponents()
        addConstraints()
        settingsRedButton()
    }
    
    func settingsRedButton() {
        barItem.target = self
        barItem.action = #selector(editPage)
    }
    
    @objc func editPage() {
        a = 1 - a // Переключение состояния между 0 и 1
        
        
        if a == 0 {
            
            barItem.title = "Редактировать"
            editImageView.isHidden = true
            editImageView.isUserInteractionEnabled = false
            
            viewBotConstraintsTop.constant = 0
            
            print(a)
            let image = profileImage.image
            if let imageData = image!.jpegData(compressionQuality: 1.0) {
                UserDefaults.standard.set(imageData, forKey: "profileImage")
            }
            if let FIOText = FIOTextField.text {
                UserDefaults.standard.set(FIOTextField.text, forKey: "FIO")
                labelFIO.text = FIOText
            }
            if let groupText = groupTextField.text {
                UserDefaults.standard.set(groupTextField.text, forKey: "Group")
                labelGroup.text = "Номер группы: \(groupText)"
            }
            if let rukText = rukTextField.text {
                UserDefaults.standard.set(rukTextField.text, forKey: "Ruk")
                labelRukovod.text = "Руководитель: \(rukText)"
            }
            if let phoneText = phoneTextField.text {
                UserDefaults.standard.set(phoneTextField.text, forKey: "phone")
                labelRukovod.text = "Номер телефона руководителя: \(phoneText)"
            }
            
            
        } else {
            barItem.title = "Сохранить"
            editImageView.isHidden = false
            editImageView.isUserInteractionEnabled = true
            viewBotConstraintsTop.constant = -320
            
            print(a)
        }
        
        
        UIView.animate(withDuration: 0.3) { [self] in
            self.view.layoutIfNeeded()
        }
        
    }

    
    @objc func editImage() {
        // Режим редактирования
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    
    func addComponents() {
        self.navigationItem.rightBarButtonItem = barItem
        view.addSubview(OnProfileImageView)
        OnProfileImageView.addSubview(profileImage)
        OnProfileImageView.addSubview(editImageView)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(editImage))
        editImageView.addGestureRecognizer(gesture)
        view.addSubview(viewBot)
        view.addSubview(labelFIO)
        view.addSubview(labelGroup)
        view.addSubview(labelRukovod)
        view.addSubview(phoneRukovodGroup)
        view.addSubview(infoImage)
        view.addSubview(labelinfo)
        
    }
    

    
    func loadProfileImage() {
        if let imageData = UserDefaults.standard.data(forKey: "profileImage") {
            if let savedImage = UIImage(data: imageData) {
                profileImage.image = savedImage
            }
        }
        
        if let FIOText = UserDefaults.standard.string(forKey: "FIO") {
            labelFIO.text = FIOText
        }
        if let gtoupText = UserDefaults.standard.string(forKey: "Group") {
            labelGroup.text = "Номер группы: \(gtoupText)"
        }
        if let rukText = UserDefaults.standard.string(forKey: "Ruk") {
            labelRukovod.text = "Руководитель: \(rukText)"
        }
        if let phoneText = UserDefaults.standard.string(forKey: "phone") {
            phoneRukovodGroup.text = "Номер телефона руководителя: \(phoneText)"
        }
    }
    
    func addConstraints() {
        
        OnProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        OnProfileImageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        OnProfileImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        OnProfileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        OnProfileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 230).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 230).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: OnProfileImageView.centerYAnchor, constant: 0).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: OnProfileImageView.centerXAnchor).isActive = true
        
        editImageView.translatesAutoresizingMaskIntoConstraints = false

        editImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        editImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        editImageView.centerYAnchor.constraint(equalTo: OnProfileImageView.centerYAnchor, constant: 0).isActive = true
        editImageView.centerXAnchor.constraint(equalTo: OnProfileImageView.centerXAnchor).isActive = true
        
        viewBot.translatesAutoresizingMaskIntoConstraints = false
        viewBot.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        viewBot.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        viewBot.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        viewBotConstraintsTop = viewBot.topAnchor.constraint(equalTo: view.bottomAnchor)
        viewBotConstraintsTop.isActive = true
        
        labelFIO.translatesAutoresizingMaskIntoConstraints = false
        labelFIO.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        labelFIO.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelFIO.topAnchor.constraint(equalTo: editImageView.bottomAnchor, constant: 100).isActive = true
        
        addBotViews()
        
        labelGroup.translatesAutoresizingMaskIntoConstraints = false
        labelGroup.topAnchor.constraint(equalTo: labelFIO.bottomAnchor, constant: 30).isActive = true
        labelGroup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        labelRukovod.translatesAutoresizingMaskIntoConstraints = false
        labelRukovod.topAnchor.constraint(equalTo: labelGroup.bottomAnchor, constant: 10).isActive = true
        labelRukovod.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        phoneRukovodGroup.translatesAutoresizingMaskIntoConstraints = false
        phoneRukovodGroup.topAnchor.constraint(equalTo: labelRukovod.bottomAnchor, constant: 10).isActive = true
        phoneRukovodGroup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        infoImage.translatesAutoresizingMaskIntoConstraints = false
        infoImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        infoImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        infoImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        
        labelinfo.translatesAutoresizingMaskIntoConstraints = false
        labelinfo.topAnchor.constraint(equalTo: infoImage.topAnchor, constant: 0).isActive = true
        labelinfo.leftAnchor.constraint(equalTo: infoImage.rightAnchor, constant: 5).isActive = true
        labelinfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
    }
    
    func addBotViews() {
        let viewOneBot = createBotView()
        let viewTwoBot = createBotView()
        let viewThreeBot = createBotView()
        let viewFourBot = createBotView()
        
        let viewsArray = [ viewOneBot, viewTwoBot, viewThreeBot, viewFourBot ]
        for i in viewsArray {
            viewBot.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        viewOneBot.topAnchor.constraint(equalTo: viewBot.topAnchor, constant: 20).isActive = true
        viewOneBot.leftAnchor.constraint(equalTo: viewBot.leftAnchor, constant: 10).isActive = true
        viewOneBot.rightAnchor.constraint(equalTo: viewBot.rightAnchor, constant: -10).isActive = true
        viewOneBot.bottomAnchor.constraint(equalTo: viewBot.topAnchor, constant: 80).isActive = true
        
        viewTwoBot.topAnchor.constraint(equalTo: viewBot.topAnchor, constant: 90).isActive = true
        viewTwoBot.leftAnchor.constraint(equalTo: viewBot.leftAnchor, constant: 10).isActive = true
        viewTwoBot.rightAnchor.constraint(equalTo: viewBot.rightAnchor, constant: -10).isActive = true
        viewTwoBot.bottomAnchor.constraint(equalTo: viewBot.topAnchor, constant: 150).isActive = true
        
        viewThreeBot.topAnchor.constraint(equalTo: viewBot.topAnchor, constant: 160).isActive = true
        viewThreeBot.leftAnchor.constraint(equalTo: viewBot.leftAnchor, constant: 10).isActive = true
        viewThreeBot.rightAnchor.constraint(equalTo: viewBot.rightAnchor, constant: -10).isActive = true
        viewThreeBot.bottomAnchor.constraint(equalTo: viewBot.topAnchor, constant: 220).isActive = true
        
        viewFourBot.topAnchor.constraint(equalTo: viewBot.topAnchor, constant: 230).isActive = true
        viewFourBot.leftAnchor.constraint(equalTo: viewBot.leftAnchor, constant: 10).isActive = true
        viewFourBot.rightAnchor.constraint(equalTo: viewBot.rightAnchor, constant: -10).isActive = true
        viewFourBot.bottomAnchor.constraint(equalTo: viewBot.topAnchor, constant: 290).isActive = true
        
        let labelFIOBot: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .ultraLight)
            label.text = "Фамилия Имя Отчество:"
            return label
        }()
        
        viewOneBot.addSubview(labelFIOBot)
        labelFIOBot.translatesAutoresizingMaskIntoConstraints = false
        labelFIOBot.leftAnchor.constraint(equalTo: viewOneBot.leftAnchor, constant: 25).isActive = true
        labelFIOBot.topAnchor.constraint(equalTo: viewOneBot.topAnchor, constant: 5).isActive = true
        
        viewOneBot.addSubview(FIOTextField)
        
        FIOTextField.translatesAutoresizingMaskIntoConstraints = false
        FIOTextField.topAnchor.constraint(equalTo: labelFIOBot.bottomAnchor, constant: 1).isActive = true
        FIOTextField.leftAnchor.constraint(equalTo: viewOneBot.leftAnchor, constant: 20).isActive = true
        FIOTextField.rightAnchor.constraint(equalTo: viewOneBot.rightAnchor, constant: -20).isActive = true
        FIOTextField.bottomAnchor.constraint(equalTo: viewOneBot.bottomAnchor, constant: -5).isActive = true
        
        let labelGroupBot: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .ultraLight)
            label.text = "Номер группы:"
            return label
        }()
        
        
        viewTwoBot.addSubview(labelGroupBot)
        labelGroupBot.translatesAutoresizingMaskIntoConstraints = false
        labelGroupBot.leftAnchor.constraint(equalTo: viewTwoBot.leftAnchor, constant: 25).isActive = true
        labelGroupBot.topAnchor.constraint(equalTo: viewTwoBot.topAnchor, constant: 5).isActive = true
        
        
        
        viewTwoBot.addSubview(groupTextField)
        groupTextField.translatesAutoresizingMaskIntoConstraints = false
        groupTextField.topAnchor.constraint(equalTo: labelGroupBot.bottomAnchor, constant: 1).isActive = true
        groupTextField.leftAnchor.constraint(equalTo: viewTwoBot.leftAnchor, constant: 20).isActive = true
        groupTextField.rightAnchor.constraint(equalTo: viewTwoBot.rightAnchor, constant: -20).isActive = true
        groupTextField.bottomAnchor.constraint(equalTo: viewTwoBot.bottomAnchor, constant: -5).isActive = true
        
        let labelRukBot: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .ultraLight)
            label.text = "Руководитель:"
            return label
        }()
        
        viewThreeBot.addSubview(labelRukBot)
        labelRukBot.translatesAutoresizingMaskIntoConstraints = false
        labelRukBot.leftAnchor.constraint(equalTo: viewThreeBot.leftAnchor, constant: 25).isActive = true
        labelRukBot.topAnchor.constraint(equalTo: viewThreeBot.topAnchor, constant: 5).isActive = true
        
        viewThreeBot.addSubview(rukTextField)
        rukTextField.translatesAutoresizingMaskIntoConstraints = false
        rukTextField.topAnchor.constraint(equalTo: labelRukBot.bottomAnchor, constant: 1).isActive = true
        rukTextField.leftAnchor.constraint(equalTo: viewThreeBot.leftAnchor, constant: 20).isActive = true
        rukTextField.rightAnchor.constraint(equalTo: viewThreeBot.rightAnchor, constant: -20).isActive = true
        rukTextField.bottomAnchor.constraint(equalTo: viewThreeBot.bottomAnchor, constant: -5).isActive = true
        
        let labelRukPhoneBot: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .ultraLight)
            label.text = "Номер телефона руководителя:"
            return label
        }()
        
        viewFourBot.addSubview(labelRukPhoneBot)
        labelRukPhoneBot.translatesAutoresizingMaskIntoConstraints = false
        labelRukPhoneBot.leftAnchor.constraint(equalTo: viewFourBot.leftAnchor, constant: 25).isActive = true
        labelRukPhoneBot.topAnchor.constraint(equalTo: viewFourBot.topAnchor, constant: 5).isActive = true
        
        viewFourBot.addSubview(phoneTextField)
        phoneTextField.translatesAutoresizingMaskIntoConstraints = false
        phoneTextField.topAnchor.constraint(equalTo: labelRukPhoneBot.bottomAnchor, constant: 1).isActive = true
        phoneTextField.leftAnchor.constraint(equalTo: viewFourBot.leftAnchor, constant: 20).isActive = true
        phoneTextField.rightAnchor.constraint(equalTo: viewFourBot.rightAnchor, constant: -20).isActive = true
        phoneTextField.bottomAnchor.constraint(equalTo: viewFourBot.bottomAnchor, constant: -5).isActive = true
        
    }
}


extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
