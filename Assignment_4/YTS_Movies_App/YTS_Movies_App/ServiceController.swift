//
//  ServiceController.swift
//  YTS_Movies_App
//
//  Created by user202363 on 12/16/21.
//

import UIKit


class ServiceController{
    
    static var shared = ServiceController()
    
    func getMovies(handler: @escaping ([movies]) -> Void)
    {
        let urlString = "https://yts.mx/api/v2/list_movies.json"
        let urlObj = URL(string: urlString)!
        
        var task = URLSession.shared.dataTask(with: urlObj){ apidata, apiresponse, error in
            
            if let error = error{
                print(error)
     
            }
            else if let correct_data = apidata{
                do{
                    let decoder = JSONDecoder()
                    let resultFromDecoder = try?
                        decoder.decode(result.self, from: correct_data)
                    handler(resultFromDecoder!.data.movies)
                }catch{
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getImage(url: String, handler : @escaping (Result<UIImage,Error>) -> Void)
    {
        let urlObj = URL(string : url)!
        
        let task = URLSession.shared.dataTask(with: urlObj){data, apiresponse, error in
            
            if let error = error{
                print(error)
                handler(.failure(error))
            }
            else if let correct_data = data{
                let img = UIImage(data: correct_data)
                handler(.success(img!))
            }
        }
        task.resume()
    }
    
}
