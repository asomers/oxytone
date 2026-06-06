import module namespace n = 'normalize';
import module namespace p = 'paginate';

let $_ := store:read('glaux')
for $tlg in store:keys()
  let $urn := tokenize($tlg, '/')
  let $pager := p:pager($tlg)
  return
    if (exists($pager)) then
      for $page in $pager?list
      let $doc := n:get-normalized($urn[1], $urn[2], $page)
      let $_ := trace(`{$tlg}/{$page}`)
      return db:put('normalized', $doc, `{$tlg}/{$page}`)
    else
      let $doc := n:get-normalized($urn[1], $urn[2])
      let $_ := trace($tlg)
      return db:put('normalized', $doc, $tlg)
