// DeuxLangues.swift
// Dictionnaire Reverso
// Novembre - 2017

//--------------------
import UIKit
//--------------------

class DeuxLangues: UIViewController {
    
  
    @IBOutlet weak var fr: UITextField!
    @IBOutlet weak var en: UITextField!
    
    var arrFrench: [String]!
    var arrEnglish: [String]!
    
    //--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
    }
    
    //--------------------
    // Fonction pour ajouter les nouvelles mots en addition dans le dictionnaire

    @IBAction func add(_ sender: UIButton) {
        arrFrench.append(fr.text!)
        arrEnglish.append(en.text!)
        
        UserDefaults.standard.set(arrFrench, forKey: "FRANÇAIS")
        UserDefaults.standard.set(arrEnglish, forKey: "ANGLAIS")
    }
    
    //-------------------------
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
