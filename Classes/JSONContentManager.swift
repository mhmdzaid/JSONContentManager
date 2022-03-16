//
//  JSONContentManager.swift
//  JSONContentManager
//
//  Created by Mohamed Zead on 16/03/2022.
//

import Foundation
/// Used to retrieve content from json file and pass values to placeholders in string
public class JSONContentManager {
    private var JSONFile: String
    private var bundle: Bundle = .main
    
    /// - Parameters:
    ///     - JSONFile: file name
    ///     - bundle: bundle , main by default
    public init(JSONFile: String, bundle: Bundle = .main) {
        self.JSONFile = JSONFile
        self.bundle = bundle
    }
    
    
    /// Returns Any value from json given its path
    /// - Parameter path: path to the value in json
    public func value(from path: String) -> Any {
        return getValue(for: path)
    }
    
    
    /// Returns String value from json given its path and optionally if placeholders exist
    ///
    /// - Parameters:
    ///     - path: path to the value in json.
    ///     - placeholders: placeholders to be replaced in json
    public func stringValue(from path: String, placeholders: [Any] = []) -> String {
        var stringContent = getValue(for: path) as? String
        stringContent?.apply(placeholders)
        return stringContent ?? ""
    }
    
    
    /// Loops through the dictionary till finds the value
    func getValue(for path: String) -> Any {
        do {
            if let json = try getJSONContent() {
                let keys = path.components(separatedBy: ".")
                var trackerDictionary = json
                for key in keys {
                    if trackerDictionary[key] is [String: Any] {
                        trackerDictionary = trackerDictionary[key] as! [String : Any]
                    } else {
                        return trackerDictionary[key] ?? ""
                    }
                }
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        return ""
    }
    
    
    /// Reads json file and serializing it to json object
    func getJSONContent() throws -> [String: Any]? {
        if let path = bundle.path(forResource: JSONFile, ofType: "json") {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String: Any]
        }
        return nil
    }
}
