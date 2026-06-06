import module namespace n = 'normalize';

let $_ := store:read('glaux')
for $tlg in store:keys()
  let $urn := tokenize($tlg, '/')
  let $doc := n:get-normalized($urn[1], $urn[2])
  let $_ := trace($tlg)
  return db:put('normalized', $doc, $tlg)
