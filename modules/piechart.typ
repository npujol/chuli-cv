#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": chart
#import "styles.typ": *

#let render-activities(slices: ()) = {
    cetz.canvas({
        // A linear gradient from blue gradient-init to blue gradient-end
        let gradient = gradient.linear(colors.gradient-init, colors.gradient-end)

        chart.piechart(
            slices,
            radius: 1.5,
            slice-style: gradient,
            inner-radius: .5,
            label-key: "name",
            value-key: "val",
        )
    })
}
