watch-cv:
  typst watch ./template/cv.typ ./output/cv.pdf --font-path ./src/fonts/ 

watch-letter:
  typst watch ./template/letter.typ ./output/letter.pdf --font-path ./src/fonts/

compile-cv:
  typst compile ./template/cv.typ ./output/cv.pdf --font-path ./src/fonts/

compile-letter: 
  typst compile ./template/letter.typ ./output/letter.pdf  --font-path ./src/fonts/ 