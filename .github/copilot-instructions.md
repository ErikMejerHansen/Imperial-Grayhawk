# GitHub Copilot Instructions for Imperial Grayhawk

## Note: PWA Removed

PWA support has been removed from this project. Ignore previous instructions about updating `sw.js` — the repository no longer includes a service worker or web app manifest.

## Project Structure

- `/maps/` - Map images and location pages
  - Location pages follow pattern: `locationname.html` with accompanying `Locationname-Lore.md`
- `/handouts/` - PDFs and other player handouts
- `/assets/` - Icons, decorative elements
- `index.html` - Main landing page
- `styles.css` - Global styles (note: `nav a` has button styling)

## Project Structure

- `/maps/` - Map images and location pages
  - Location pages follow pattern: `locationname.html` with accompanying `Locationname-Lore.md`
- `/handouts/` - PDFs and other player handouts
- `/assets/` - Icons, decorative elements
- `index.html` - Main landing page
- `styles.css` - Global styles (note: `nav a` has button styling)

## Styling Notes

- Global `nav a` styles create button-like appearance with borders and backgrounds
- To create simple text links, use `<div>` instead of `<nav>` or override all button styles inline
- Theme uses dark fantasy aesthetic with parchment textures and aged appearance
