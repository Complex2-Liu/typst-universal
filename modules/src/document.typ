#import "../config.typ": config

#let document_setup(doc) = {
  set document(
    title: config.document.title,
    author: config.document.author,
    keywords: config.document.keywords,
    date: config.document.date,
  )

  doc
}

/* vim: set ft=typst: */
