//
//  UserDefaults.swift
//  MyProject
//
//  Created by  Alex on 07.11.2020.
//

import Foundation

final class Key<T: Codable> {
    let _key: String
    init(_ key: String) {
        self._key = key
    }
}

class Defaults {
    static let shared = Defaults()
    private var userDefaults = UserDefaults.standard
    
    /// метод сохранения объекта
    /// - Parameters:
    ///   - object: объект, который хочешь сохранить
    ///   - key: ключ под которым хочешь сохранить
    func set<T: Codable>(_ object: T, for key: String) {
        guard let data = try? JSONEncoder().encode(object) else { fatalError("Encode has error") }
        userDefaults.setValue(data, forKey: key)
    }
    
    /// метод получения объекта назад
    /// - Parameter key: ключ
    /// - Returns: вернется то, что в дженерик засунул, но опциональное
    func getObject<T: Codable>(with key: Key<T>) -> T? {
        guard let data = userDefaults.object(forKey: key._key) as? Data, let object = try? JSONDecoder().decode(T.self, from: data) else { return nil }
        return object
    }
    
    /// для коллекции удалить объект
    /// - Parameter key: ключ под которым удалится что-то
    func remove(for key: String) {
        userDefaults.removeObject(forKey: key)
    }
    
}
