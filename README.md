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

## File Structure

```
Imperial-Grayhawk/
├── index.html          # Main page
├── styles.css          # Styling
├── maps/              # Store map images here
│   └── README.md
├── handouts/          # Store handout PDFs here
│   └── README.md
└── README.md          # This file
```

## Asset Optimization

This repository includes an automated asset optimization pipeline to reduce file sizes and improve page load times.

### Running Optimization Locally

To optimize images locally, run:

```bash
./optimize-assets.sh
```

**Requirements:**
- ImageMagick (for PNG and JPG optimization)
- pngquant (optional, for better PNG compression)

The script will:
- Optimize all PNG and JPG images in the repository
- Output optimized files to the `optimized-assets/` folder
- Preserve original files unchanged
- Show file size reduction statistics

**Note:** The `optimized-assets/` folder is excluded from git tracking via `.gitignore`.

### Automated CI/CD Pipeline

The repository includes a GitHub Actions workflow that automatically optimizes assets when:
- Changes to image files are pushed to the `main` branch
- A pull request with image changes is created or updated
- The workflow is manually triggered

The workflow:
1. Runs the optimization script automatically
2. Generates a report showing file size reductions
3. Uploads optimized assets as workflow artifacts
4. Comments on pull requests with optimization results

**Accessing Optimized Assets:**
- Navigate to the "Actions" tab in GitHub
- Select a workflow run
- Download the "optimized-assets" artifact

**Deployment:** Optimized assets are not automatically committed to the repository. During deployment, you can download the optimized assets from the workflow artifacts and use them in production.

## Tips

- Use descriptive filenames (e.g., `grayhawk-city-map.png` instead of `map1.png`)
- Keep file sizes reasonable for easy downloading
- Run the optimization script before committing large images
- Update session notes regularly to help players remember what happened
- PNG works great for maps, PDF for text handouts

Enjoy your campaign! 🎲
