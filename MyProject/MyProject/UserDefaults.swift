//
//  UserDefaults.swift
//  MyProject
//
//  Created by  Alex on 07.11.2020.
//

import Foundation

class DefaultsKeys {
    init() {}
}

extension DefaultsKeys {
    static let kItems = Key<[Item]>("kSaveArrayItems")
}

final class Key<T: Codable>: DefaultsKeys {
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
    func set<T: Codable>(_ object: T, for key: Key<T>) {
        if isSwiftCodableType(T.self) || isFoundationCodableType(T.self) {
            userDefaults.set(object, forKey: key._key)
            return
        }
        
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(object) else { return }
        userDefaults.set(encoded, forKey: key._key)
        userDefaults.synchronize()
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
    func remove<T: Codable>(for key: Key<T>) {
        userDefaults.removeObject(forKey: key._key)
        userDefaults.synchronize()
    }
    
    private func isSwiftCodableType<T>(_ type: T.Type) -> Bool {
        switch type {
        case is String.Type, is Bool.Type, is Int.Type, is Float.Type, is Double.Type:
            return true
        default:
            return false
        }
    }
    
    private func isFoundationCodableType<T>(_ type: T.Type) -> Bool {
        switch type {
        case is Date.Type:
            return true
        default:
            return false
        }
    }
    
}
