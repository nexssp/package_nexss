function isURIWeb($v) {
    $uri = $v -as [System.URI]
    $uri.AbsoluteURI -ne $null -and $uri.Scheme -match '[http|https]'
}