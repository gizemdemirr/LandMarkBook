//
//  ViewController.swift
//  LandMarkBook
//
//  Created by Gizem on 17.06.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//her fonksiyonda kullanabilmek için class altında tanımlanır
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    var choseLandmarkNames = ""
    var choseLandmarkImages = UIImage()
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self yazarsan viewcontrollerı sana verir.
//        her tableview olşturulduğunda bu işlem yapılır, selfe yani viewcontollera eşitlenir
        tableView.delegate = self
        tableView.dataSource = self

//        dizi oluşturmak
        
        landMarkNames.append("Colosseum")
        landMarkNames.append("Great Wall")
        landMarkNames.append("Kremlin")
        landMarkNames.append("Stonehenge")
        landMarkNames.append("Tac Mahal")
//        resim dizisi oluşturma
        
        landMarkImages.append(UIImage(named: "colessum")!)
        landMarkImages.append(UIImage(named: "greatWall")!)
        landMarkImages.append(UIImage(named: "kremlin")!)
        landMarkImages.append(UIImage(named: "stonehenge")!)
        landMarkImages.append(UIImage(named: "tacmahal")!)
        
//        başlık atmak için
        navigationItem.title = "Landmark Book"
        
    }
//    tableviewden seçilen dizi elemanını silme işlemi
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            indexpath.row : kullanıcı hangi satırı silmek isterse onu siler.
            landMarkNames.remove(at: indexPath.row)
            landMarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    

    //bu iki fonksiyonu yazmadığımda bunları kullanma hakkım olmaz
//her bir sıra içinde göstereceğim şey ne olacak?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        bu sınıftan bir obje oluşturuyorum bunu kullanarak istediğim içeriği gösterebilirim
        let cell =  UITableViewCell()
//        indexpath.row = bana hangi sırada hangi indeximin olduğunu döndürür örnek 0.index 1.sırada gibi
        cell.textLabel?.text = landMarkNames[indexPath.row]
        return cell
    }
//    tableviewde kaç tane sıra olacak?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }
// sequeyi yönlendirmek için , tıklayınca diğer tarafa gitmek
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        nereye tıklandıysa o indexi alıp değişkene atadım
        choseLandmarkNames = landMarkNames[indexPath.row]
        choseLandmarkImages = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewControllerSegue", sender: nil)
    }
    
//    prepare fonksiyonunu kullanarak değişkene atadığım indexi seçtiğim alana eşitleyebilirim. Veri aktarımı yapılan yer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue kontrolü yapmak için (eğer bu sequem yapılıyorsa)
        if segue.identifier == "toImageViewControllerSegue"{
//            imageViewControlleri bir değişkene tanımlama(hedef viewcontrollerı al değişkene kaydet)
            let destinationVC = segue.destination as! imageViewController
//            burada imageViewControllerda tanımladığım değişkenleri çekebiliyorum
            destinationVC.selectedLandmarkName = choseLandmarkNames
            destinationVC.selectedLandmarkImage = choseLandmarkImages
        }
    }


}

