# Imperial Grayhawk Campaign Site

## Project Overview

This is a D&D campaign website for the "Imperial Grayhawk" campaign - a dark fantasy tabletop RPG setting. The site serves as a player resource hub, providing access to maps, handouts, NPC information, and session notes.

**Type:** Static HTML/CSS website
**Theme:** Dark fantasy with parchment textures and aged aesthetic
**Campaign Setting:** The Empire of Grayhawk - a grim and perilous fantasy world

## Technology Stack

- **Frontend:** Vanilla HTML5, CSS3
- **Fonts:** Google Fonts (Cinzel, IM Fell DW Pica)
- **Hosting:** Designed for static hosting (GitHub Pages, Netlify, Vercel, or local serving)
- **No build process:** Direct HTML/CSS files, no compilation needed

## Project Structure

```
Imperial-Grayhawk/
├── index.html              # Main landing page with navigation
├── styles.css              # Global styles with dark fantasy theme
├── assets/                 # UI decorative elements
│   ├── border.png
│   ├── seal.png
│   ├── stamp.png
│   ├── star.png
│   └── watermark.png
├── icons/                  # App icons
│   ├── icon-192x192.png
│   └── icon-512x512.png
├── maps/                   # Map images and location pages
│   ├── *.PNG               # Map images
│   ├── *.html              # Location detail pages (e.g., northkeep.html)
│   └── *-Lore.md           # Lore documents (e.g., Northkeep-Lore.md)
├── handouts/               # PDFs and player handouts
├── npcs/                   # NPC character pages
│   └── *.html              # Individual NPC pages (e.g., dorian.html, nerys.html)
├── sessions/               # Session recaps and notes
│   └── *.html              # Session pages (e.g., session1.html)
└── Imperial_Shield.png     # Campaign logo/favicon
```

## Design Guidelines

### Visual Theme
- **Dark fantasy aesthetic** with aged parchment appearance
- **Color palette:** Warm browns, aged paper tones, dark backgrounds
- **Typography:** Cinzel for headers (medieval feel), IM Fell DW Pica for body text
- **Decorative elements:** Stars, shields, seals, ornate borders

### Styling Conventions
- Global `nav a` styles create button-like appearance with borders and backgrounds
- To create simple text links, use `<div>` instead of `<nav>` or override button styles inline
- Consistent use of decorative dividers (◆) between sections
- Page frame with ornate borders for immersive feel

### Content Patterns

**Location Pages** (`maps/*.html`):
- Follow pattern: `locationname.html` with accompanying `Locationname-Lore.md`
- Include map images, descriptions, and navigation back to main site

**NPC Pages** (`npcs/*.html`):
- Individual character pages with portraits, descriptions, and stats
- Consistent formatting across all NPC entries

**Session Notes** (`sessions/*.html`):
- Chronological campaign recaps
- Include dates, key events, and player decisions

## Development Practices

### When Adding Content

**New Map:**
1. Save map image to `/maps/` folder
2. Create location page if needed: `maps/locationname.html`
3. Create lore document if needed: `maps/Locationname-Lore.md`
4. Update `index.html` navigation/links

**New Handout:**
1. Save PDF/image to `/handouts/` folder
2. Update relevant section in `index.html`

**New NPC:**
1. Create `npcs/charactername.html` following existing pattern
2. Add navigation link from relevant pages

**New Session:**
1. Create `sessions/sessionX.html`
2. Update navigation in `index.html`

### File Naming Conventions
- Use descriptive, lowercase names with hyphens for readability
- Location pages: `locationname.html` (e.g., `northkeep.html`)
- Lore files: `Locationname-Lore.md` (capitalized, e.g., `Northkeep-Lore.md`)
- NPC pages: `charactername.html` (e.g., `dorian.html`, `nerys.html`)
- Session pages: `sessionX.html` (e.g., `session1.html`)

### Code Style
- Use semantic HTML5 elements
- Maintain consistent indentation (4 spaces)
- Include ARIA labels for accessibility where appropriate
- Keep inline styles minimal; prefer CSS classes

## Important Notes

### PWA Removed
**PWA support has been removed** from this project. Do not add or reference:
- Service worker (`sw.js`)
- Web app manifest
- Service worker registration

The site is now a simple static website without offline capabilities.

### Testing Locally
To test the site locally:
```bash
# Python 3
python3 -m http.server 8000

# Node.js
npx http-server -p 8000
```
Then open `http://localhost:8000`

### Hosting
Suitable for:
- GitHub Pages
- Netlify
- Vercel
- Any static file hosting service

## Campaign Context

**Setting:** The Empire of Grayhawk - a dark fantasy realm
**Tone:** Grim and perilous, medieval fantasy
**Tagline:** "The Empire Holds."
**Primary Locations:** Northkeep and surrounding territories

## Permissions

When working on this project, Claude Code may:
- ✅ Create/edit HTML pages for maps, NPCs, sessions, and handouts
- ✅ Modify `styles.css` for styling improvements
- ✅ Add new assets to `/assets/`, `/maps/`, `/handouts/`, `/npcs/`, `/sessions/`
- ✅ Update `index.html` for navigation and content
- ✅ Run local development servers for testing
- ❌ Do NOT add PWA features (manifest, service worker)
- ❌ Do NOT add build processes or transpilation
- ❌ Do NOT change the core dark fantasy aesthetic without explicit request
