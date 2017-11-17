// ViewController.swift
// Dictionnaire Reverso
// Novembre - 2017

//--------------------
import UIKit
//--------------------
//Fait la conexion datosource e delegate
//Fait la insertion dans la class UIViewController
//Donner les protocoles  UITableViewDelegate, UITableViewDataSource
//Creer las fonctions tableview
//---------------------------
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrFrench: [String]! //Declaration de variable qui va recevoir la traduction en Français.
    var arrEnglish: [String]! //Declaration de variable qui va recevoir la traduction en Anglais.
    
    var dict: [String: String]! //Declaration de variable dictionnaire qui va orgniser les mots.
    var keys: [String]!
    
    @IBOutlet weak var francais: UIButton!
    @IBOutlet weak var anglais: UIButton!
    @IBOutlet weak var result: UILabel! //Connexion et déclaration de la Label result, qui present le significad de la mot indique
    @IBOutlet weak var tabview: UITableView!
    
    //----------------------
     var buttons: [UIButton]!   // La exclamation indique que va informer valeur aprés dans le var buttons
    //-----------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managerUser()
        buttons = [francais, anglais]
        dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
    }
    
    //------------- Fonctions -------------------------
    
    // Çette fonction met l'accent sur le bouton de la langue séelectionnée à traduire, lalangue française commence à se déemarquer, tandis que l'anglais est opaque, lorsque la langue anglaise est séelectionnée, l'opacité est inversée.
    
    @IBAction func actionForButtons(_ sender: UIButton) {
        if sender.alpha == 1.0 {
            return
        }
        for button in buttons {
            if button.alpha == 1.0 {
                button.alpha = 0.5
            } else {
                button.alpha = 1.0
                displayFrancaisOrAnglais(francaisOrAnglais: sender.currentTitle!)
            }
        }
    }
    
    //-------------------------------
    func displayFrancaisOrAnglais(francaisOrAnglais: String) {
        if francaisOrAnglais == "FRANÇAIS" {
            dict = Dictionary(uniqueKeysWithValues: zip(arrFrench, arrEnglish))
        } else {
            dict = Dictionary(uniqueKeysWithValues: zip(arrEnglish, arrFrench))
        }
        tabview.reloadData()
    }
    
    
    //-------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrFrench.count
    }
    
    //-------------------------------
    
    // Definition des configurations de tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        keys = [String](dict.keys)
        cell.textLabel?.text = keys[indexPath.row]
        // Quand cliquez la mot dans le tableview
        return cell
    }
    
    //----------------------------------
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Quand cliquez la mot dans la tableview, retorune le mot dans le dictionnarie.
        result.text = dict[keys[indexPath.row]]
    }
    
   //-----------------------------------
     // Initialisation des tables en français et en anglais pour reconstituer les dictionnaries qui apparaitront dans le tableau
    
    func managerUser() {
//        UserDefaults.standard.removeObject(forKey: "FRANÇAIS")
//        UserDefaults.standard.removeObject(forKey: "ANGLAIS")
        if UserDefaults.standard.object(forKey: "FRANÇAIS") != nil {
            arrFrench = UserDefaults.standard.object(forKey: "FRANÇAIS") as! [String]
            arrEnglish = UserDefaults.standard.object(forKey: "ANGLAIS") as! [String]
        } else {
            
             // Initialisation des tables en français et en anglais pour reconstituer les dictionnaries qui apparaitront dans le tableau avec les mots initiales
            arrFrench = [String]()
            arrEnglish = [String]()
            
        }
    }
    
    // Pour activier le clavier
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    
     // Pour retourner le clavier
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    //-------------------
}

