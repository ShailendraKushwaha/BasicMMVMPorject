//
//  ViewController.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 26/02/22.
//

import UIKit

class MovieListVC: UIViewController {
    
    private lazy var movieTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate   =  self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.separatorStyle = .none
        tableView.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.reuseIdentifier)
        return tableView
    }()
    
    private var movieListViewModel : MovieListViewModel = MovieListViewModel()
    private var movies :[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setNavigationTitle(title: "Movie List")
        setUpView()
        self.movieListViewModel.movies.bind({[weak self] _ in
            self?.movieTableView.reloadData()
        })
        self.getMoviesList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.movieTableView.reloadData()
    }
    
    private func setUpView(){
        self.view.addSubview(self.movieTableView)
        movieTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        movieTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        movieTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        movieTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func getMoviesList(){
        
        APIHandler.sharedInstance.getAPI(params: APIParams.getParamforMovies(), stringURL: APIEndpoint.movieEnPoint(query: "", pageNum: 1), onSuccess: {[weak self]dictionary in
            DispatchQueue.main.async{
                do {
                    if let results = dictionary["results"] as? NSArray {
                        let data = try JSONSerialization.data(withJSONObject: results, options: .fragmentsAllowed)
                        self?.movies = try JSONDecoder().decode([Movie].self, from: data)
                        self?.movieListViewModel.movies.value = self?.movies.compactMap({
                            MovieListCellViewModel(id: String($0.id), title:$0.title,image:$0.getThumbnailAddress(),isFavourite:$0.favourite)
                        })
                       
                    }
                }
                catch {
                    //Show alert or error label on screen here
                    print(error.localizedDescription)
                }
            }
            
        }, onFailure: {error in
            print(error.localizedDescription)
            
        })
    }
}

extension MovieListVC : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { movieListViewModel.movies.value?.count ?? 0 }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {  90 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.reuseIdentifier, for: indexPath) as? MovieListCell else {
            fatalError("ErrorCell ")
        }
        cell.movieListViewModel = self.movieListViewModel.movies.value?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieDetailsVC()
        vc.movieDetailsVM = MovieDetailsViewModel(movie: self.movies[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
    
