//
//  ViewController.swift
//  NewsReader
//
//  Created by Egor on 07.12.2019.
//  Copyright © 2019 Egor. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var MyArticles = [Article]()
    let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=1f5e50e618f2489ea86b4f7a13a2dde4")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    //Парсинг
        NewsParser.parse(url: newsURL) { (data) in
            guard let data = data else {return}
            do{
                let decoder = JSONDecoder()
                let NewsFromJson = try decoder.decode(News.self, from: data)
                self.MyArticles = NewsFromJson.articles
                self.tableView.reloadData()
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    //Передача данных в SecondView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC"{
            if let destinationVC = segue.destination as? SecondViewController{
                guard let selectedRow = tableView.indexPathForSelectedRow?.row,
                let newsURL = MyArticles[selectedRow].url else {return}
                destinationVC.webURL = URL(string: newsURL)
            }
        }
    }
}

//Работа с таблицей
extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MyArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as? NewsCell{
            cell.selectionStyle = .none
            
            cell.background.setBackgroundForView()
            
            if let title = MyArticles[indexPath.row].title{
                cell.postTitle.text = title
            }
            if let name = MyArticles[indexPath.row].source.name{
                cell.postAuthor.text = name
            }
            if let urlToImage = MyArticles[indexPath.row].urlToImage{
                cell.imageURL = URL(string: urlToImage)
            }
            return cell
        }else{
            return UITableViewCell()
        }
    }
}


