#let colors = (
  accent: rgb("#007fad"),
  inactive: luma(170),
  navy: rgb("#001f3f"),
  aqua: rgb("#7fdbff")
)

#let vLine() = [
  #h(5pt)
]

#let hline() = [
  #box(width: 1fr, line(stroke: 0.9pt, length: 100%))
]

#let dashed-line() = [
    line(
    length: 100%, 
    stroke: (
      paint: colors.inactive, 
      thickness: 1pt, 
      dash: "dashed"
    )
  )
]

#let page-style = (
  paper: "a4",
  margin: (
    left: 1cm,
    right: 1cm,
    top: 0.8cm,
    bottom: 0.4cm,
  )
)

#let body-style = (
  fonts: ("Source Sans Pro", "Font Awesome 6 Brands", "Font Awesome 6 Free"),
  size: 10pt,
  weight: "regular"
)

#let list-style = (
  indent: 1em
)

#let header-style = (
  fonts: ("Source Sans Pro"),
  table: (
    columns: (5fr, 1fr),
    column-gutter: 30pt
  ),
  full-name: (
    size: 36pt,
    weight: "bold"
  ),
  job-title: (
    size: 18pt,
    weight: "bold"
  ),
  profile-photo: (
    width: 100pt, 
    height: 100pt, 
    stroke: none, 
    radius: 9999pt,
    image-height: 10.0cm
  ),
  margins: (
    between-info-and-socials: 2.5mm,
    bottom: 3pt
  ),
  socials: (
    column-gutter: 10pt
  )
)

#let section-style = (
  title: (
    size: 16pt,
    weight: "bold",
    font-color: black 
  ),
  margins: (
    top: 3pt,
    right-to-hline: 2pt,
  )
)

#let entry-style = (
  table: (
    columns: (5%, 1fr)
  ),
  title: (
    size: 10pt,
    weight: "bold",
    color: black
  ),
  company-or-university: (
    size: 10pt,
    weight: "bold",
    color: colors.accent
  ),
  time-and-location: (
    size: 10pt,
    weight: "regular",
    color: black
  ),
  margins: (
    top: 3pt,
    between-logo-and-title: 8pt,
    between-title-and-subtitle: 3pt,
    between-time-and-location: 10pt,
    between-icon-and-text: 5pt
  )
)

// Skills
#let skills-style = (
  columns: (18%, 1fr),
  stroke: 1pt + colors.accent,
  radius: 20%,
  margins: (
    between-skill-tags: 6pt,
    between-categories: -4pt
  )
)

// language
#let language-style = (
  columns: (18%, 1fr),
  stroke: 1pt + colors.accent,
  radius: 5pt,
  margins: (
    top: 3pt,
    between-tags: 3pt,
    between-categories: -6pt,
    between-icon-and-text: 5pt
  )   
)

// Education with table style
#let fancy_education = (
  margins: (
    top: 3pt,
    between-logo-and-text: 5pt,
  )
)