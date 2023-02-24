//
//  ClassName.swift
//  ProtocolOrientedProgrammingMvvMC
//
//  Created by Hosein Alimoradi on 12/3/1401 AP.
//

func className(of aClass: AnyObject) -> String {
    return String(describing: type(of: aClass))
}

func className(of aClass: AnyClass) -> String {
    return String(describing: aClass.self)
}
