//
//  ViewController.swift
//  WITSDemo
//
//  Created by Kondya on 12/11/18.
//  Copyright © 2018 Kondya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    @IBOutlet weak var booksBtn: UIButton!
    @IBOutlet weak var musicBtn: UIButton!
    @IBOutlet weak var gamesBtn: UIButton!
    
    var book : [bookArrayModel] = []
    var music : [musicArrayModel] = []
    var game : [gameArrayModel] = []
    
    var seletedTab : Int!
    
    
    @IBAction func commonBtnAction(_ sender: Any)
    {
        switch (sender as AnyObject).tag
        {
        case 1:
            loadDataBook()
            print("\(1)")
        break;
        case 2:
            print("\(2)")
            loadDataMusic()
        break;
        case 3:
            print("\(3)")
            loadDataGames()
        break;
        default: ()
        break;
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadDataBook()
    }
    @IBOutlet weak var accesoryTbleView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if self.seletedTab == 0
        {
             return self.book.count
        }else
        if self.seletedTab == 1
        {
                return self.music.count
        }
        else
            {
                return self.game.count
        }
        
       
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.seletedTab == 0
        {
            
            
            let cellReuseIdentifier = "VcontrollerCell"
            // create a new cell if needed or reuse an old one
            let cell:VcontrollerCell = (self.accesoryTbleView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! VcontrollerCell?)!
            
            cell.autherNameLbl.text = self.book[indexPath.row].authorName
            cell.typeLbl.text = self.book[indexPath.row].type
            cell.titleLbl.text = self.book[indexPath.row].title
            cell.accesoryImgView.imageFromURL(urlString: self.book[indexPath.row].ImageUrl!)
            
            // set the text from the data model
            
            return cell
        }else
            if self.seletedTab == 1
            {
                
                let cellReuseIdentifier = "VcontrollerCell"
                // create a new cell if needed or reuse an old one
                let cell:VcontrollerCell = (self.accesoryTbleView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! VcontrollerCell?)!
                
                cell.autherNameLbl.text = self.music[indexPath.row].authorName
                cell.typeLbl.text = self.music[indexPath.row].type
                cell.titleLbl.text = self.music[indexPath.row].title
                cell.accesoryImgView.imageFromURL(urlString: self.music[indexPath.row].ImageUrl!)
                
                // set the text from the data model
                
                return cell
            }
            else
            {
                
                let cellReuseIdentifier = "VcontrollerCell"
                // create a new cell if needed or reuse an old one
                let cell:VcontrollerCell = (self.accesoryTbleView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! VcontrollerCell?)!
                
                cell.autherNameLbl.text = self.game[indexPath.row].authorName
                cell.typeLbl.text = self.game[indexPath.row].type
                cell.titleLbl.text = self.game[indexPath.row].title
                cell.accesoryImgView.imageFromURL(urlString: self.game[indexPath.row].ImageUrl!)
                
                // set the text from the data model
                
                return cell
        }
        
        
        
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("You tapped cell number \(indexPath.row).")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 101
    }


    func loadDataBook()  {
        
       seletedTab = 0
        guard let gitUrl = URL(string: "https://www.wits-interactive.com/ftp/test/books.json") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(BookDataModel.self, from: data)
                print(gitData.BookData.book )
                self.book = []
                self.book.append(contentsOf: gitData.BookData.book)
                
                
               // self.wallDataArray.append(contentsOf: gitData.post_list )
                DispatchQueue.main.async {
                    self.accesoryTbleView.reloadData()
                   
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    
    func loadDataGames()  {
        
        seletedTab = 2
        guard let gitUrl = URL(string: "https://www.wits-interactive.com/ftp/test/games.json") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GameDataModel.self, from: data)
                print(gitData.GamesData.game )
                self.game = []
                self.game.append(contentsOf: gitData.GamesData.game)
                
                
                // self.wallDataArray.append(contentsOf: gitData.post_list )
                DispatchQueue.main.async {
                    self.accesoryTbleView.reloadData()
                    
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    
    
    func loadDataMusic()  {
        
        seletedTab = 1
        guard let gitUrl = URL(string: "https://www.wits-interactive.com/ftp/test/music.json") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MusicDataModel.self, from: data)
                print(gitData.iTunes.itune )
                self.music = []
                self.music.append(contentsOf: gitData.iTunes.itune)
                
                
                // self.wallDataArray.append(contentsOf: gitData.post_list )
                DispatchQueue.main.async {
                    self.accesoryTbleView.reloadData()
                    
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    
}

extension UIImageView {
    public func imageFromURL(urlString: String) {
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
}

