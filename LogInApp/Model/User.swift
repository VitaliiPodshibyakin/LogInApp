//
//  User.swift
//  LogInApp
//
//  Created by Виталий Подшибякин on 16.06.2024.
//

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "u",
            password: "p",
            person: Person(
                firstName: "Vitalii",
                secondName: "Podshibyakin",
                about: "Рыбалка для скуфов",
                image: "Image"
            )
        )
    }
}

struct Person {
    let firstName: String
    let secondName: String
    let about: String
    let image: String
    
    var fullName: String {
        "\(firstName) \(secondName)"
    }
}
