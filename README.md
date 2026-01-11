# Imperial Grayhawk Campaign Site

A dark fantasy-themed website for your D&D campaign, featuring maps and handouts for your players.

## Getting Started

1. **Open the site**: Simply open `index.html` in your web browser
2. **Add your content**:
   - Place map images in the `/maps` folder
   - Place handout PDFs/images in the `/handouts` folder
3. **Update the links**: Edit `index.html` to point to your actual files

## Adding New Content

### Adding a Map

1. Save your map file to the `/maps` folder
2. Open `index.html` and find the `<section id="maps">` section
3. Copy an existing `.resource-card` div and update it:

```html
<div class="resource-card">
    <h3>Your Map Name</h3>
    <p>Brief description of the map</p>
    <a href="maps/your-map-file.png" class="download-btn" download>Download</a>
</div>
```

### Adding a Handout

1. Save your handout to the `/handouts` folder
2. Open `index.html` and find the `<section id="handouts">` section
3. Copy an existing `.resource-card` div and update it:

```html
<div class="resource-card">
    <h3>Your Handout Name</h3>
    <p>Brief description</p>
    <a href="handouts/your-handout.pdf" class="download-btn" download>Download</a>
</div>
```

### Adding Session Notes

Find the `<section id="notes">` section and add:

```html
<div class="note-entry">
    <h3>Session X: Title</h3>
    <p class="date">Date: January 10, 2026</p>
    <p>Your session summary here...</p>
</div>
```

## Customization

- **Change the campaign name**: Edit the `<h1>` tag in `index.html`
- **Modify colors**: Edit the CSS variables in `styles.css` (lines 3-11)
- **Add new sections**: Copy the section structure from existing sections

## Hosting Options

To share with your players:

1. **Local Network**: Share the folder and have players open `index.html`
2. **GitHub Pages**: 
   - Push to GitHub
   - Enable Pages in repository settings
   - Share the URL
3. **Netlify/Vercel**: Drop the folder for instant hosting
4. **Google Drive**: Upload and share (viewers can download files)

## Progressive Web App (PWA)

This site is configured as a Progressive Web App (PWA), which means it can be installed on devices and used offline.

### Testing PWA Functionality

**Local Testing:**
1. Serve the site using a local web server (required for service workers):
   ```bash
   # Python 3
   python3 -m http.server 8000
   
   # Node.js (npx http-server)
   npx http-server -p 8000
   ```
2. Open `http://localhost:8000` in your browser
3. Check for the install prompt or use browser DevTools to test PWA features

**Chrome/Edge DevTools:**
1. Open DevTools (F12)
2. Go to "Application" tab
3. Check "Manifest" to verify manifest.json is loaded
4. Check "Service Workers" to verify the service worker is registered
5. Test offline mode using the "Offline" checkbox in the Network tab

**Installing on Mobile:**
- **iOS Safari**: Tap the Share button, then "Add to Home Screen"
- **Android Chrome**: Tap the menu (⋮), then "Add to Home Screen" or "Install app"

**Installing on Desktop:**
- **Chrome/Edge**: Look for the install icon in the address bar, or use the menu to install

Once installed, the app will:
- Work offline (after first visit)
- Have its own app icon
- Run in standalone mode (without browser UI)
- Cache maps and handouts for offline access

## File Structure

```
Imperial-Grayhawk/
├── index.html          # Main page
├── styles.css          # Styling
├── manifest.json       # PWA manifest
├── sw.js              # Service worker for offline support
├── icons/             # PWA app icons
│   ├── icon-192x192.png
│   └── icon-512x512.png
├── assets/            # UI assets (stars, seals, etc.)
├── maps/              # Store map images here
│   └── README.md
├── handouts/          # Store handout PDFs here
│   └── README.md
└── README.md          # This file
```

## Tips

- Use descriptive filenames (e.g., `grayhawk-city-map.png` instead of `map1.png`)
- Keep file sizes reasonable for easy downloading
- Update session notes regularly to help players remember what happened
- PNG works great for maps, PDF for text handouts

Enjoy your campaign! 🎲
