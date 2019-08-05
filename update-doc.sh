#!/bin/sh
main() {

  doc=""

  for section in `ls code`
  do
  temp="
  <section aria-labelledby=\"section-${section}\">\n
    <h3 id=\"section-${section}\">${section}</h3>\n
    $(cat "code/${section}/header.html")\n
    <div class=\"grid\">\n
      <div>\n
        <h4>Svelte 2</h4>\n
        <pre data-src=\"code/${section}/input.html\"></pre>\n
      </div>\n
      <div>\n
        <h4>Svelte 3</h4>\n
        <pre data-src=\"code/${section}/output.html\"></pre>\n
      </div>\n
    </div>\n
  </section>\n
  "
  doc="$doc$temp"
  done

  # Concatenate files
  cat head.html > index.html
  echo $doc >> index.html
  cat tail.html >> index.html
  #echo $doc
}

main
