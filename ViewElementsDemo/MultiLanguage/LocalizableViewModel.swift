//
//  LocalizableViewModel.swift
//  ViewElementsDemo
//
//  Created by Infinity Tech on 19/1/22.
//

import Foundation

class LocalizableViewModel: ObservableObject {
    
    @Published var helloWorld = "hello"
    
    func changeLocalize(localize: String){
        self.helloWorld = "hello_world".localizableString(loc: localize)
    }
}


extension String {
    func localizableString(loc: String) -> String {
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

