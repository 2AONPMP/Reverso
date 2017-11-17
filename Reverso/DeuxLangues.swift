// DeuxLangues.swift
// Dictionnaire Reverso
// Novembre - 2017

//--------------------
import UIKit
//--------------------

class DeuxLangues: UIViewController {
    
    // Déclaration des boutons en "Français" et "Anglais" pour choisir quels mots seront préesentées dnas le tableau.
    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!
    
    // Déclaration des tables qui sauveront les mots en "Français" et "Anglais"
    var arrFrench: [String]!
    var arrEnglish: [String]!
    
    //--------------------
    //Appelez la fonction les mots dans memoire
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
    }
    
    //--------------------
    
    // Fonction pour ajouter les nouvelles mots en addition dans le dictionnaire
    @IBAction func add(_ sender: UIButton) {
        // Ajoute des mots en Français
        arrFrench.append(fr.text!)
        // Ajoute des mots en Anglais
        arrEnglish.append(en.text!)
        
        // Insertion des mots en Français
        UserDefaults.standard.set(arrFrench, forKey: "FRANÇAIS")
         // Insertion des mots en Anglais
        UserDefaults.standard.set(arrEnglish, forKey: "ANGLAIS")
    }
    
    //-------------------------
    // Guarder les mots dans memoire
    func managerUser() {
        if UserDefaults.standard.object(forKey: "FRANÇAIS") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "FRANÇAIS") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "ANGLAIS") as! [String]
        } else {
            arrFrench = [String]()
            arrEnglish = [String]()
        }
    }
    //---------------------
}
