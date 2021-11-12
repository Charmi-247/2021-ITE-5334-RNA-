//
//  ImageManager.swift
//  Image_Viewer_App
//
//  Created by user202363 on 11/12/21.
//

import Foundation

//------------ImageManager Model Class-------------
class ImageManager
{
    //---------Image List Declaration---------
    private var ImageList = [Image]()
    
    //----------Add new Image to List------------
    func addNewImage(n:Image)
    {
        ImageList.append(n)
    }
    
    //---------Get Whole Image List---------------
    func getAllImages()->[Image]{
        return ImageList
    }
}
