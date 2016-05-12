//
//  AdcNovoItemTableViewController.swift
//  Lista de Viagem
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 07/04/16.
//  Copyright © 2016 Leonardo Rodrigues de Morais Brunassi. All rights reserved.
//

import UIKit

class AdcNovoItemTableViewController: UITableViewController {

    var itens : [Item] = []
    var item : Item!
    var cidade : Cidade!
    var itensArray : Array<Item>?
    var tutoView: UIView!
    
    
    
    var msgView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tutoView = Tutorial(frame: CGRectMake(0, 0, tableView.frame.width, tableView.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        if(cidade.itens != nil) {
            
                itensArray = cidade.itens?.allObjects as? [Item]
            
        }
        
       // reloadData()
        
        
        //Tira as linhas desnecessárias na tabela.
        let footerView  = UIView(frame: CGRectZero)
        footerView.backgroundColor = UIColor(red: 0, green: 0, blue: 54, alpha: 1.0)
        tableView.tableFooterView = footerView
        
        msgView = MsgSemItens(frame: CGRectMake(0, 0, tableView.frame.width, tableView.frame.height))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()self.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        noItens()
    }

  
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if cidade.itens?.count == 0 {
            return 1
        } else {
            return (cidade.itens?.count)!
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ItensCell", forIndexPath: indexPath) as! ItensTableViewCell
        cell.nomeItem.text = ""
        cell.qtdItem.text = ""
        
        print("Selecionou a cidade : \(cidade.itens?.count)")
        if(cidade.itens?.count != 0){
            
            if (itensArray![indexPath.row].cidade?.nomeCidade == cidade.nomeCidade) {
                cell.textLabel?.hidden = true
                cell.nomeItem.text = itensArray![indexPath.row].nomeItem
                cell.qtdItem.text = itensArray![indexPath.row].quantidade
                cell.textLabel?.userInteractionEnabled = true
                cell.accessoryType = .DisclosureIndicator
            
        
            }
        }
        else {
            noItens()
//            cell.textLabel?.hidden = false
//            //cell.textLabel?.text = "Não há itens registrados"
//            cell.textLabel?.textColor = UIColor.grayColor()
//            cell.textLabel?.textAlignment = NSTextAlignment.Center
//            tableView.userInteractionEnabled = true
//            cell.accessoryType = .None
        }
        
        return cell
    }
    
    func noItens() {
        if !self.view.subviews.contains(tutoView) {
            if itensArray!.isEmpty {
                self.tableView.scrollEnabled = false
                self.view.addSubview(tutoView)
            }
        }
            
        else {
            if !itensArray!.isEmpty {
                self.tableView.scrollEnabled = true
                tutoView.removeFromSuperview()
            }
        }
    }
    
    
    @IBAction func adcItem(sender: AnyObject) {
        let alertaNovoItem = UIAlertController(title: "Adicione um novo item em sua lista de viagem!", message: "", preferredStyle: .Alert)
        var nomeItemTF = UITextField()
        var qtdTF = UITextField()
        
        
        alertaNovoItem.addTextFieldWithConfigurationHandler { (textField) -> Void in
            nomeItemTF = textField
            textField.placeholder = "Item"
            textField.keyboardType = .Default
        }
        
        alertaNovoItem.addTextFieldWithConfigurationHandler { (textField) -> Void in
            qtdTF = textField
            textField.placeholder = "Quantidade"
            textField.keyboardType = .Default
        }
        
        alertaNovoItem.view.layer.shadowColor = UIColor.blackColor().CGColor
        alertaNovoItem.view.layer.shadowOffset = CGSizeZero
        alertaNovoItem.view.layer.shadowOpacity = 1
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        let salvar = UIAlertAction(title: "Salvar", style: .Default) { (ACTION) -> Void in
            if nomeItemTF.text == "" || qtdTF.text == "" {
                let alertaCampoVazio = UIAlertController(title: nil, message: "Item e Quantidade obrigatório!", preferredStyle: .Alert)
                alertaCampoVazio.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                self.presentViewController(alertaCampoVazio, animated: true, completion: nil)
            } else {
                self.item = ItemManager.sharedInstance.novoItem()
                self.item.nomeItem = nomeItemTF.text!
                self.item.quantidade = qtdTF.text!
                self.item.cidade = self.cidade
               
            }
            ItemManager.sharedInstance.salvar()
            self.reloadData()
            CidadeManager.sharedInstance.salvar()
        }
        
        
        alertaNovoItem.addAction(cancelar)
        alertaNovoItem.addAction(salvar)
        presentViewController(alertaNovoItem, animated: true, completion: nil)
        self.reloadData()
    }
    
    func reloadData(){
        itensArray = ItemManager.sharedInstance.Item()
        tableView.reloadData()
    }
    
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            ItemManager.sharedInstance.deletar(self.itensArray![indexPath.row])
            ItemManager.sharedInstance.salvar()
            tableView.reloadData()
            reloadData()
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
