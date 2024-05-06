#import "@preview/fontawesome:0.1.0": *
#import "modules/styles.typ": *
#import "modules/header.typ": *
#import "modules/section.typ": *
#import "modules/skills.typ": *
#import "modules/languages.typ": *
#import "modules/piechart.typ": *


// Global variables
//--------------------------------------------
#let colors = (
  accent: rgb("#007fad"),
  inactive: luma(170)
)

// Cover letter Styles
//--------------------------------------------

#let letterHeaderNameStyle(str) = {
  text(
    fill: colors.accent,
    weight: "bold",
    str
  )
}

#let letterHeaderAddressStyle(str) = {
  text(
  fill: colors.inactive,
  size: 0.9em,
  smallcaps(str)
  )
}

#let letterDateStyle(str) = {
  text(
    size: 0.9em,
    style: "italic",
    str
  )
}

#let letterSubjectStyle(str) = {
  text(
    fill: colors.accent,
    weight: "bold",
    underline(str)
  )
}

#let footerStyle(str) = {
  text(
    size: 8pt,
    fill: colors.inactive,
    smallcaps(str)
  )
}

// Cover letter Components
//--------------------------------------------

#let letterHeader(
  name: "Your Name Here",
  address: "Your Address Here",
  recipientName: "Company Name Here",
  recipientAddress: "Company Address Here",
  date: "Today's Date",
  subject: "Subject: Hey!"
) = {
  letterHeaderNameStyle(name)
  v(1pt)
  letterHeaderAddressStyle(address)
  v(1pt)
  align(right, letterHeaderNameStyle(recipientName))
  v(1pt)
  align(right, letterHeaderAddressStyle(recipientAddress))
  v(1pt)
  letterDateStyle(date)
  v(1pt)
  letterSubjectStyle(subject)
  linebreak(); linebreak()
}

#let letterSignature(path) = {
  linebreak()
  place(
    right, 
    dx:-65%, 
    dy:-4%, 
    image(path, width: 25%)
  )
}

#let letterFooter(name: "Your Name Here") = {
  place(
    bottom,
    table(
      columns: (1fr, auto),
      inset: 0pt,
      stroke: none,
      footerStyle(name),
    )
  )
}

// Cover letter layout
//--------------------------------------------

#let cover_letter(doc) = {
  set text(
    weight: "regular",
    size: 9pt,
  )
  set align(left)
  set page(
    paper: "a4",
    margin: (
      left: 1.4cm,
      right: 1.4cm,
      top: .8cm,
      bottom: .4cm,
    ),
  )
  doc
}

// CV Styles
//--------------------------------------------


#let cv(
  content
) = {
  
  set text(
    font: body-style.fonts,
    weight: body-style.weight,
    size: body-style.size,
  )
  set list(
    indent: list-style.indent
  )
  set align(left)
  set page(
    paper: page-style.paper,
    margin: page-style.margin,
  )
  content
}

#let header(
  full-name: [],
  job-title: [],
  // Each array item must have a property link, text and icon to be displayed.
  socials: (),
  profile-picture: ""
) = {
  table(
    columns: header-style.table.columns,
    inset: 0pt,
    stroke: none,
    column-gutter: header-style.table.column-gutter,
    align: left + horizon,
    {
      create-header-info(
        full-name: full-name,
        job-title: job-title,
        socials: socials
      )
    },
    {
      create-header-image(
        profile-photo: profile-picture
      )
    }
  )
  v(header-style.margins.bottom)
}

let body(
  content
) = {
  content
}

#let section(title) = {
  v(section-style.margins.top)
  create-section-title(title)
}

#let entry(
  title: "", 
  company-or-university: "", 
  date: "", 
  location: "", 
  logo: "", 
  description: ()
) = {
  v(entry-style.margins.top)
  table(
    columns: entry-style.table.columns,
    inset: 0pt,
    stroke: none,
    align: horizon,
    column-gutter: entry-style.margins.between-logo-and-title,
    {image(logo)},
    table(
      columns: (1fr),
      inset: 0pt,
      stroke: none,
      row-gutter: entry-style.margins.between-title-and-subtitle,
      align: auto,
      {
        text(
          size: entry-style.title.size,
          weight: entry-style.title.weight,
          fill: entry-style.title.color,
          title
        )
        text(
          size: entry-style.company-or-university.size, 
          weight: entry-style.company-or-university.weight, 
          fill: entry-style.company-or-university.color, 
          " @" + company-or-university
        )
      },
      {
        table(
          columns: 2,
          inset: 0pt,
          stroke: none,
          align: horizon,
          column-gutter: entry-style.margins.between-time-and-location,
          {table(
            columns: 2,
            inset: 0pt,
            stroke: none,
            align: horizon,
            column-gutter: entry-style.margins.between-icon-and-text,
            {if date.len() > 0{fa-hourglass-2()}},
            {text(
              size: entry-style.time-and-location.size, 
              weight: entry-style.time-and-location.weight, 
              fill: entry-style.time-and-location.color, 
              date
            )},
          )},
          {table(
            columns: 2,
            inset: 0pt,
            stroke: none,
            align: horizon,
            column-gutter: entry-style.margins.between-icon-and-text,
            {if location.len() > 0{fa-location-dot()}},
            {text(size: 10pt, location)}
          )},
        )
      },
    )
  )
  
  text()[
    #v(3pt)
    #description
  ]
}

#let skill(
  skills: ()
) = {
  v(skills-style.margins.between-categories)
  render-skills(skills: skills)
}

#let language(
  name: "",
  label: "",
  nivel: 2
) = {
  table(
    columns: language-style.columns,
    inset: 0pt,
    row-gutter: 2pt,
    stroke: none,
    align: (horizon, right),
    text(
      name, 
      size: 10pt, 
      weight: "bold", 
      fill: colors.accent,
    ),
    render-language(nivel: nivel),
    table.hline(
      stroke: (
        paint: colors.inactive, 
        thickness: 1pt, 
        dash: "dashed"
      )
    ),
    text(
      label, 
      size: 10pt, 
      fill: colors.inactive, 
      weight: "light"
    )
  )
}

#let free_time(name: "",icon:"") = {
  table(
    columns: language-style.columns,
    inset: 0pt,
    column-gutter: 1pt,
    stroke: none,
    align: (horizon, left),
    {icon},
    text(
      name, 
      size: 10pt, 
    ),
  )
  dashed-line()
}

#let fancy_education(  
  title: "", 
  company-or-university: "", 
  date: "", 
  location: "", 
  logo: "", 
  gpa: "",
  gpa_total: "" 
) = {
  table(
    columns: 2,
    stroke: none,
    inset: 0pt,
    row-gutter: 4pt,
    column-gutter: 4pt,
    table(
      columns: (5%, 1fr),
      inset: 0pt,
      column-gutter: 2pt,
      row-gutter: 2pt,
      stroke: none,
      align: horizon,
      image(
        logo, 
        width: 10pt, 
        height: 10pt
      ),
      text(
        title,           
        size: 10pt,
        weight: "bold",
        fill: black,
      ),
      {},
      text(
        " " + company-or-university,
        size: 10pt,
        weight: "bold",
        fill: colors.accent, 
      )
    ),
    table.vline(),
    table.cell(
      text(
        "GPA",
        size: 10pt, 
        weight: "bold"
      ),
      align: center,
    ),
    table.cell(
      table(
        columns: 4,
        stroke: none,
        inset: 3pt,
        fa-calendar-days(),
        text(
          size: 10pt, 
          date
        ),
        fa-location-dot(),
        text(
          size: 10pt, 
          location
        )   
      ),
      align: center,
    ),
    table.cell(
      {
        text(
          gpa,
          size: 10pt,
          fill: colors.accent,
        )
        text("/ " + gpa_total)
      },
      inset: 4pt,
    )
  )
}

#let piechart(activities: ()) = {
  figure(render-activities(slices: activities))
}