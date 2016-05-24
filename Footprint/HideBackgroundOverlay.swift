/*
Fileaname: HideBackgroundOverlay.swift
Names: Matt Gigliotti, JT Kearney, Abigail Oliver
Class: Programming Languages, Final Project
Professor: Laurie King

Abstract:
This class provides an MKOverlay that can be used to hide MapKit's
underlaying map tiles.
*/

import Foundation
import MapKit

/**
    This class provides an MKOverlay that can be used to hide MapKit's
    underlaying map tiles.
*/
class HideBackgroundOverlay: MKPolygon {

    /// - returns: a HideBackgroundOverlay object that covers the world.
    class func hideBackgroundOverlay() -> HideBackgroundOverlay {
        var corners =  [MKMapPointMake(MKMapRectGetMaxX(MKMapRectWorld), MKMapRectGetMaxY(MKMapRectWorld)),
                        MKMapPointMake(MKMapRectGetMinX(MKMapRectWorld), MKMapRectGetMaxY(MKMapRectWorld)),
                        MKMapPointMake(MKMapRectGetMinX(MKMapRectWorld), MKMapRectGetMinY(MKMapRectWorld)),
                        MKMapPointMake(MKMapRectGetMaxX(MKMapRectWorld), MKMapRectGetMinY(MKMapRectWorld))]
        return HideBackgroundOverlay(points: &corners, count: corners.count)
    }

    /**
        - returns: true to tell MapKit to hide its underlying map tiles, as long
            as this overlay is visible (which, as you can see above, is
            everywhere in the world), effectively hiding all map tiles and
            replacing them with a solid colored MKPolygon.
    */
    override func canReplaceMapContent() -> Bool {
        return true
    }


}

