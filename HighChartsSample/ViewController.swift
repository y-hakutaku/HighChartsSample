//
//  ViewController.swift
//  HighChartsSample
//
//  Created by Hakutaku on 2018/10/07.
//  Copyright © 2018 Hakutaku. All rights reserved.
//

import UIKit
import Highcharts

class ViewController: UIViewController {

    var chartView: HIChartView!
    
    @objc override func viewDidLoad() {
        super.viewDidLoad()
        self.chartView = HIChartView(frame: self.view.bounds)
        
        let chart = HIChart()
        chart.type = "line"
        chart.polar = true
        chart.margin = [0,0,0,0]
        
        let credits = HICredits()
        credits.enabled = false
        
        let title = HITitle()
        title.text = ""
//        let subtitle = HISubtitle()
//        subtitle.text = "Team statistics"
        
        let exporting = HIExporting()
        exporting.enabled = false
        
        let pane = HIPane()
        pane.size = "50%"
        
        let xAxis = HIXAxis()
        xAxis.categories = [
            "AAAAA",
            "BBBBB",
            "CCCCC",
            "DDDDD",
            "EEEEE",
            "FFFFF",
            "GGGGG",
            "HHHHH"
        ]
        
        xAxis.lineWidth = 0
        xAxis.tickmarkPlacement = "on"
        xAxis.labels = HILabels()
        xAxis.labels.enabled = true
        xAxis.gridLineColor = HIColor(hexValue: "dbe4e7")
        let yAxis = HIYAxis()
        yAxis.min = 0
        yAxis.max = 5
        yAxis.labels = HILabels()
        yAxis.labels.enabled = false
        yAxis.gridLineColor = HIColor(hexValue: "dbe4e7")
        yAxis.gridLineInterpolation = "polygon"
        yAxis.tickInterval = 1
        
        let tooltip: HITooltip = HITooltip()
        tooltip.enabled = false
        
        let legend = HILegend()
        legend.enabled = false
        
        /** base JS code
         series: [
            {
              type: 'area',
              animation: false,
              enableMouseTracking: false,
              data: [3.4,3.0,3.0,3.3,2.8,2.9,4.2,3.0],
              pointPlacement: 'on',
              color: '#66b7dc',
              fillOpacity: 0.35,
              lineColor: '#4f93ba',
              lineWidth: 1,
              marker: {
                fillColor: '#4f93ba',
                radius: 3,
                lineColor: '#4f93ba',
            }
        ]
        */
        // to create
        let area = HIArea()
        area.animation = nil
        area.enableMouseTracking = false
        area.data = [3.4,3.0,3.0,3.3,2.8,2.9,4.2,3.0]
        area.pointPlacement = "on"
        
        area.color = HIColor(hexValue: "66b7dc")
        area.fillOpacity = 0.35
        area.lineColor = HIColor(hexValue: "4f93ba")
        area.lineWidth = 1
        
        let marker = HIMarker()
        marker.fillColor = HIColor(hexValue: "4f93ba")
        marker.radius = 3
        marker.lineColor = HIColor(hexValue: "4f93ba")
        area.marker = marker
        
        let options = HIOptions()
        options.chart = chart
        options.title = title
        options.exporting = exporting
        options.pane = pane
        options.tooltip = tooltip
        options.legend = legend
        options.series = [area]
        
        options.xAxis = [xAxis]
        options.yAxis = [yAxis]
        //options.series = [line1]
        
        options.credits = credits
        chartView.options = options;
        
        self.view.addSubview(chartView)
       
    }


}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
