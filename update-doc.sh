#!/bin/sh
main() {


doc=""

  for section in `ls code`
  do
  temp="
  <section aria-labelledby=\"section-${section}\">
    <h3 id=\"section-${section}\">${section}</h3>
    <p>A description about ${section} goes here...</p>
    <div class=\"grid\">
      <div>
        <h4>Svelte 2</h4>
        <pre data-src=\"code/${section}/input.html\"></pre>
      </div>
      <div>
        <h4>Svelte 3</h4>
        <pre data-src=\"code/${section}/output.html\"></pre>
      </div>
    </div>
  </section>
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
