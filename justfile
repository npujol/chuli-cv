watch-cv:
  typst watch ./cv.typ ./output/cv.pdf --font-path ./src/fonts/ 

watch-letter:
  typst watch ./letter.typ ./output/letter.pdf --font-path ./src/fonts/

compile-cv:
  typst compile ./cv.typ ./output/cv.pdf --font-path ./src/fonts/

compile-letter: 
  typst compile ./letter.typ ./output/letter.pdf  --font-path ./src/fonts/ 