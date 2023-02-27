//
//  ViewController.swift
//  GuessNumber
//
//  Created by Alexey Gaidykov on 27.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let numberField: UITextField = {
        let number = UITextField()
        number.translatesAutoresizingMaskIntoConstraints = false
        number.placeholder = "Введите число"
        number.borderStyle = .roundedRect
        return number
    }()
    
     private let guessButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Угадать", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(guessNumber), for: .touchUpInside)
        return button
    }()
    
    private let resultLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()

    // Элементы интерфейса
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(numberField)
        view.addSubview(guessButton)
        view.addSubview(resultLabel)
        addConstraint()
    }
    // Обработчик нажатия на кнопку "Угадать"
    @objc func guessNumber() {
        // Получение случайного числа в диапазоне от 1 до 10
        let randomNumber = Int.random(in: 1...10)
        // Проверка, соответствует ли введенное число случайному числу
        if let guessedNumber = Int(numberField.text ?? ""), guessedNumber == randomNumber {
            resultLabel.text = "Поздравляем! Вы угадали число!"
        } else {
            resultLabel.text = "К сожалению, вы не угадали. Попробуйте еще раз."
        }
        // Очистка текстового поля
        numberField.text = nil
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            numberField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            numberField.widthAnchor.constraint(equalToConstant: 200),
            numberField.heightAnchor.constraint(equalToConstant: 30),
            
            guessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            guessButton.topAnchor.constraint(equalTo: numberField.bottomAnchor, constant: 20),
            guessButton.widthAnchor.constraint(equalToConstant: 200),
            guessButton.heightAnchor.constraint(equalToConstant: 30),
            
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultLabel.topAnchor.constraint(equalTo: guessButton.bottomAnchor, constant: 20),
            resultLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

