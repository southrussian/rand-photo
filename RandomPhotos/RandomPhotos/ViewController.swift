//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Danil Peregorodiev on 11.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = { // создание переменной окна под картинку
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // масштабирование содержимого
        imageView.backgroundColor = .systemTeal // фон картинки
        return imageView
    }()
    
    private let button: UIButton = { // создание переменной окна под картинку
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .black
        button.setTitle("Random!", for: .normal)
        button.setTitleColor(.systemTeal, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad() // инициалиализация вьюшки
        view.backgroundColor = .systemTeal // цвет фона
        view.addSubview(imageView) // добавление подвьюшки - картинки
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300) // размеры картинки
        imageView.center = view.center // центрирование картинки
        
        view.addSubview(button)
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-50-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-40,
                              height: 50)
        
        getRandomPhoto() // вызов getRandomPhoto в инициализированном интерфейсе
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
    }
    
    func getRandomPhoto() {
        let urlString =
            "https://source.unsplash.com/random/600x600" // строка url с фотками из сети
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

