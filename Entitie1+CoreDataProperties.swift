//
//  Entitie1+CoreDataProperties.swift
//  MyPedia
//
//  Created by 安田圭佑 on 2018/01/18.
//  Copyright © 2018年 jp.ac.uryukyu.ie.e16530. All rights reserved.
//
//

import Foundation
import CoreData


extension Entitie1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entitie1> {
        return NSFetchRequest<Entitie1>(entityName: "Entitie1")
    }

    @NSManaged public var tagname: String?

}
