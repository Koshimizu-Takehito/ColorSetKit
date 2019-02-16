//
//  ExternalCommand.swift
//  ColorSetKit
//
//  Created by Takehito Koshimizu on 2019/02/10.
//

import ShellKit

// FIXME: testable
extension Command {

    static var pwd: Command {
        return "echo `pwd`"
    }

    static var findColorSets: Command {
        return "find `pwd` -name *.colorset"
    }

    static var findWorkspace: Command {
        return "find `pwd` -maxdepth 1 -name *.xcworkspace"
    }

    static var findProject: Command {
        return "find `pwd` -maxdepth 1 -name *.xcodeproj"
    }
}
