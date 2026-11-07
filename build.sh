#!/bin/sh
# Baut index.html (Handy-App) aus src/app.html
cd "$(dirname "$0")"
{
cat <<'HEAD'
<!doctype html>
<html lang="de">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#F8F7F3" media="(prefers-color-scheme: light)">
<meta name="theme-color" content="#1B1F16" media="(prefers-color-scheme: dark)">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-title" content="Tuana">
<meta name="apple-mobile-web-app-status-bar-style" content="default">
<meta name="description" content="Palästinensisch-jordanisches Arabisch aus dem Alltag lernen.">
<link rel="manifest" href="manifest.webmanifest">
<link rel="icon" href="icon-192.png" type="image/png">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0;font:14px/1.4 system-ui,-apple-system,sans-serif}img{max-width:100%}[hidden]{display:none!important}</style>
</head>
<body>
HEAD
cat src/app.html
cat <<'TAIL'
<script>if("serviceWorker" in navigator){addEventListener("load",()=>navigator.serviceWorker.register("sw.js").catch(()=>{}));}</script>
</body>
</html>
TAIL
} > index.html
echo "index.html gebaut"
