//
//  ExternalCommand.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

import Foundation

public extension Command {

    public static var pwd: Command {
        return "echo `pwd`"
    }

    public static var findColorSets: Command {
        return "find `pwd` -name *.colorset"
    }

    public static var findWorkspace: Command {
        return "find `pwd` -maxdepth 1 -name *.xcworkspace"
    }

    public static var findProject: Command {
        return "find `pwd` -maxdepth 1 -name *.xcodeproj"
    }
}
