//
//  CountryGetter.swift
//  tableview_tableViewController
//
//  Created by Caroline Zaini on 26/05/2020.
//  Copyright © 2020 Caroline Zaini. All rights reserved.
//

import UIKit

class CountryGetter {
    
    let france = Country(name: "France", capital: "Paris", countryCode: "fr")
    let espagne = Country(name: "Espagne", capital: "Madrid", countryCode: "es")
    let italie = Country(name: "Italie", capital: "Rome", countryCode: "it")
    let russie = Country(name: "Russie", capital: "Moscou", countryCode: "ru")
    let grece = Country(name: "Grece", capital: "Athènes", countryCode: "gr")
    let belgique = Country(name: "Belgique", capital: "Bruxelle", countryCode: "be")
    let allemagne = Country(name: "Allemagne", capital: "Berlin", countryCode: "de")
    let usa = Country(name: "U.S.A", capital: "Washington D.C", countryCode: "us")
    let bresil = Country(name: "Brésil", capital: "Brazilia", countryCode: "br")
    let chine = Country(name: "Chine", capital: "Pékin", countryCode: "cn")
    let japon = Country(name: "Japon", capital: "Tokyo", countryCode: "jp")
    let algerie = Country(name: "Algérie", capital: "Alger", countryCode: "dz")
    let cameroun = Country(name: "Cameroun", capital: "Younde", countryCode: "cm")
    
    
    
    func getAllCountries() -> [Country] {
        return [
        france, espagne, italie, russie, grece, belgique, allemagne, usa, bresil, chine, japon, algerie, cameroun
        ]
    }
    
    func getContinents() -> [Continent] {
        return [
          Continent(name: "Europe", countries: [france, espagne, italie, russie, grece, belgique, allemagne]),
          Continent(name: "Ameriques", countries: [usa, bresil]),
          Continent(name: "Asie", countries: [chine, japon]),
          Continent(name: "Afrique", countries: [algerie, cameroun])
        ]
    }
    
}
