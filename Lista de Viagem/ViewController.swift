//
//  ViewController.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 05/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //var cidade: [String] = ["Marília", "Londrina", "São Paulo", "São José do Rio Preto"]
    var index = NSIndexPath()
    var cidade : Cidade!
    var cidadeArray : Array<Cidade>?
    var itensArray : Array<Item>?
    
    
    var item : Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cidadeArray = []
        tableView.delegate = self
        tableView.dataSource = self
        reloadData()
        
        //Tira as linhas desnecessárias na tabela.
        let footerView  = UIView(frame: CGRectZero)
        footerView.backgroundColor = UIColor(red: 0, green: 0, blue: 54, alpha: 1.0)
        tableView.tableFooterView = footerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cidadeArray?.count == 0 {
            return 1
        } else {
            return cidadeArray!.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CidadeCell", forIndexPath: indexPath) as! CidadeTableViewCell
        
        cell.nomeCidade.text = ""
        cell.qtdDias.text = ""
        
        if (cidadeArray?.count != 0) {
            cell.msgSemCidade.hidden = false
            cell.textLabel?.hidden = true
            cell.nomeCidade.text = cidadeArray![indexPath.row].nomeCidade
            cell.qtdDias.text = (cidadeArray![indexPath.row].qtdDias! + " Dias")
            cell.textLabel?.userInteractionEnabled = true
            cell.accessoryType = .DisclosureIndicator
            
            
            print(cidadeArray![indexPath.row].nomeCidade)
            print(cidadeArray![indexPath.row].qtdDias)
        } else {
            cell.msgSemCidade.hidden = true
            cell.textLabel?.hidden = false
            cell.textLabel?.text = "Não há cidades registradas"
            cell.textLabel?.textColor = UIColor.grayColor()
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            tableView.userInteractionEnabled = true
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        reloadData()
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            CidadeManager.sharedInstance.deletar(self.cidadeArray![indexPath.row])
            CidadeManager.sharedInstance.salvar()
            ItemManager.sharedInstance.deletarTudo()
            ItemManager.sharedInstance.salvar()
            tableView.reloadData()
            reloadData()
        }
    }
    
    
   //========================================================================================
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "verItens" {
            let VC = segue.destinationViewController as! AdcNovoItemTableViewController
            let cell = sender as? UITableViewCell
            let i = tableView.indexPathForCell(cell!)
            print (i?.row)
            let objeto = cidadeArray![(i?.row)!]
            VC.cidade = objeto
//            VC.posicao = i.row
        }
    }
    //========================================================================================
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        index = indexPath
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    @IBAction func adcCidade(sender: AnyObject) {
        let alertaNovaCidade = UIAlertController(title: "Adicione uma nova cidade e o período da viagem!", message: "", preferredStyle: .Alert)
        var nomeCidadeTF = UITextField()
        var periodoTF = UITextField()
        
        alertaNovaCidade.addTextFieldWithConfigurationHandler { (textField) -> Void in
            nomeCidadeTF = textField
            textField.placeholder = "Cidade"
            textField.keyboardType = .Default
        }
        
        alertaNovaCidade.addTextFieldWithConfigurationHandler { (textField) -> Void in
            periodoTF = textField
            textField.placeholder = "Período da Viagem"
            textField.keyboardType = .Default
        }
        
        alertaNovaCidade.view.layer.shadowColor = UIColor.blackColor().CGColor
        alertaNovaCidade.view.layer.shadowOffset = CGSizeZero
        alertaNovaCidade.view.layer.shadowOpacity = 1
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        let salvar = UIAlertAction(title: "Salvar", style: .Default) { (ACTION) -> Void in
            if nomeCidadeTF.text == "" || periodoTF.text == "" {
                let alertaCampoVazio = UIAlertController(title: nil, message: "Nome da Cidade e Período da viagem obrigatório!", preferredStyle: .Alert)
                alertaCampoVazio.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alertaCampoVazio, animated: true, completion: nil)
            } else {
                self.cidade = CidadeManager.sharedInstance.novaCidade()
                self.cidade.nomeCidade = nomeCidadeTF.text!
                self.cidade.qtdDias = periodoTF.text!
                
//                self.item = ItemManager.sharedInstance.novoItem()
//                self.item.cidade = self.cidade
//                self.item.nomeItem = ""
//                self.item.quantidade = ""
            }
            //ItemManager.sharedInstance.salvar()
            CidadeManager.sharedInstance.salvar()
            self.reloadData()
        }
        
        
        alertaNovaCidade.addAction(cancelar)
        alertaNovaCidade.addAction(salvar)
        presentViewController(alertaNovaCidade, animated: true, completion: nil)
    }
    
    func reloadData(){
        cidadeArray = CidadeManager.sharedInstance.Cidade()
        tableView.reloadData()
    }

    
}

