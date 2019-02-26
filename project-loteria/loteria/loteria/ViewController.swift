//
//  ViewController.swift
//  loteria
//
//  Created by Erick Kaique da Silva on 12/02/2019.
//  Copyright © 2019 Erick Kaique da Silva. All rights reserved.
//

import UIKit
import Foundation
enum gameType: String{
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

// Criando um operador
infix operator >-<
func >-< (total: Int, universe: Int) -> [Int]{
    
    var result: [Int] = []
    // construindo um while, onde enquanto ele for menor que o total passado, faça as instruçoes abaixo
    while result.count < total{
        // Gerando um número randomico de sera o equivalente ao que eu passo. Ex: 1 á 60 - 1. que seria 59
        // porem eu acrescento mais 1 e entao ele pode ir de 1 á 60
        let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        // Caso nao exista esse número dentro do array de resultado eu insiro. Caso contrario continuo tentando
        if !result.contains(randomNumber){
            result.append(randomNumber)
        }
        
    }
    // Ordeno o array de forma crescente.
    return result.sorted()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Ao carregar a view eu faço com que os número da mega sena sejam exibidos.
        showNumbers(for: .megasena)
    }
    
    // Essa func é responsavel por exibir os números do jogo selecionado
    func showNumbers(for type: gameType){
        
        // Aqui eu acesso o rawValue que contem o nome do jogo que sera exibido. E atualizo o label que exibe
        // o name do jogo
        lbGameType.text = type.rawValue
        // este é um array que ira conter os números gerados pelo operador que criamos acima.
        var game: [Int] = []
        
        // Este switch é responsavel por saber qual o tipo de jogo que o usuário esta querendo ver os números
        switch type {
            case .megasena:
                game = 6>-<60
            // Caso seja mega sena, mostro a 6 bola com o números
            balls.last!.isHidden = false
            case .quina:
                game = 5>-<80
            // Caso contrário eu oculto ela.
            balls.last!.isHidden = true
        }
        // Este for eu faço uma tupla, pegando o valor da chave o value, e associo para sempre que gerar um novo jogo eu mudo.
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }

    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    // Esta action ela é responsavel por sempre que o usuário clicar, seja no button gerar jogo ou nos nomes
    // dos jogos, ira gerar um novo jogo sobre o respectivo jogo desejado pelo usuário
    @IBAction func generateGmae() {
        // Aqui eu faço um switch que ira dizer, se o usuário quer que exiba o jogo da Mega Sena ou Quina
        switch scGameType.selectedSegmentIndex {
            case 0:
                showNumbers(for: .megasena)
            default:
                showNumbers(for: .quina)
        }
        
    }
}

