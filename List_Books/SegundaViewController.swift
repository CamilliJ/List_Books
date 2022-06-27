//
//  SegundaViewController.swift
//  List_Books
//
//  Created by COTEMIG on 27/06/22.
//

import UIKit

class SegundaViewController: UIViewController {
    
    var livro: ViewController.Livro? = nil
    
    @IBOutlet weak var descricao: UILabel!
    @IBOutlet weak var preco: UILabel!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let livro = livro{
            image.image = UIImage(named: livro.imagem)
            nome.text = livro.titulo
            preco.text = livro.preco
            descricao.text = livro.description
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
