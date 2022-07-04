//
//  ViewController.swift
//  List_Books
//
//  Created by COTEMIG on 27/06/22.
//

import UIKit
struct Livro {
    let titulo: String
    let imagem: String
    let preco: String
    let description: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var tableView: UITableView!
    
    
    

    
    var arrayLivros = [
        Livro(titulo: "Rainha Vermelha | 1º Volume", imagem: "rainha", preco: "R$33,90", description: "Mare e sua família são vermelhos: plebeus, humildes, destinados a servir uma elite prateada cujos poderes sobrenaturais os tornam quase deuses. Mare rouba o que pode para ajudar sua família a sobreviver e não tem esperanças de escapar do vilarejo miserável onde mora."),
        
        Livro(titulo: "Trono de Vidro | 1º Volume", imagem: "trono", preco: "R$39,90", description: "Trono de vidro tem como protagonista Celaena Sardothien, a maior assassina de Adarlan, hoje condenada à escravidão nas minas de sal. Celaena recebe a proposta de participar de uma competição para se tornar a campeã do rei, em troca de sua liberdade."),
        
        Livro(titulo: "Manual de assassinato para boas garotas", imagem: "assassino", preco: "R$31,90", description: "Todos os moradores conhecem a história: Andie Bell, a garota mais popular e bonita da escola, foi assassinada pelo namorado, Sal Singh, que se suicidou após o crime. Apesar de o caso nunca ter ido a julgamento, ninguém diz “talvez”, nem “supostamente”, nem “tudo indica que” ao falar do crime."),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayLivros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ViewCell
        cell.NomeLivro?.text = arrayLivros[indexPath.row].titulo
        cell.PrecoLivro?.text = arrayLivros[indexPath.row].preco
        cell.DescripitonLivro?.text = arrayLivros[indexPath.row].description
        cell.ImageLivro?.image = UIImage(named: arrayLivros[indexPath.row].imagem)
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProximaTela" {
            let livroSelecionado = sender as! Livro
            let viewController = segue.destination as! SegundaViewController
            viewController.livro = livroSelecionado
        } else if segue.identifier == "new"{
            let viewController = segue.destination as! AdicionarViewController
            viewController.delegate = self
        }
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let livro = arrayLivros[indexPath.row]
        performSegue(withIdentifier: "ProximaTela", sender: livro)
    }
    
}

extension ViewController:AdicionarViewControllerDelegate{
    func salvarbtn(livro:Livro) {
        arrayLivros.append(livro)
        tableView.reloadData()
    }
}
