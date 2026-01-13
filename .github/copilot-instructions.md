# GitHub Copilot Instructions for Imperial Grayhawk

## PWA Service Worker Updates

**IMPORTANT**: Whenever new files are added to the project that should be accessible to players (HTML pages, images, PDFs, etc.), you MUST update the service worker:

1. **Update `sw.js`**:
   - Increment the `CACHE_NAME` version (e.g., `v1` → `v2`)
   - Add the new file paths to the `urlsToCache` array

This ensures:
- The PWA cache is invalidated and refreshed
- New content is available offline
- Players get the latest version automatically

### Example

When adding a new location page like `maps/northkeep.html`:

```javascript
// Increment version
const CACHE_NAME = 'imperial-grayhawk-v2';

// Add to cache list
const urlsToCache = [
  // ...existing files...
  './maps/northkeep.html',
  './maps/Northkeep.PNG'
];
```

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
