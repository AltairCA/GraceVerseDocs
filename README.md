# GraceVerse Docs

Published site for [GraceVerse](https://github.com/AltairCA/-GraceVerse), hosted on GitHub Pages for store listings and support.

## Live URLs (after GitHub Pages is enabled)

| Page | URL |
|------|-----|
| **Home** | `https://altairca.github.io/GraceVerseDocs/` |
| **Privacy Policy** | `https://altairca.github.io/GraceVerseDocs/privacy-policy.html` |

Use the **home URL** as the app website in Google Play Console. Use the **privacy policy URL** in the Data safety / Privacy policy field.

## Enable GitHub Pages

1. Open this repo on GitHub: **AltairCA/GraceVerseDocs**
2. Go to **Settings → Pages**
3. Under **Build and deployment**, set **Source** to **Deploy from a branch**
4. Choose branch **`main`**, folder **`/ (root)`**
5. Save — the site deploys in 1–3 minutes

## Site structure

```
GraceVerseDocs/
├── index.html              ← Landing page
├── privacy-policy.html     ← Privacy policy (Play Console link)
├── privacy-policy.md       ← Source copy (keep in sync when editing policy)
├── styles.css
├── scripts/
│   └── capture-screenshot.sh  ← Capture Android screenshots via adb
├── assets/
│   ├── icon.png
│   ├── splash-icon.png
│   └── screenshots/        ← Optional real app screenshots for phone mockups
└── .nojekyll               ← Serves static HTML as-is
```

## Updating content

- **Home page:** edit `index.html` and `styles.css`
- **Privacy policy:** edit `privacy-policy.md`, then mirror changes in `privacy-policy.html`
- **App icon:** replace `assets/icon.png` (from `apps/mobile/assets/icon.png` in the main repo)

## Google Play Console

| Field | Value |
|-------|-------|
| Website | `https://altairca.github.io/GraceVerseDocs/` |
| Privacy policy | `https://altairca.github.io/GraceVerseDocs/privacy-policy.html` |
| Contact email | altairserver@gmail.com |
| Package name | `com.altairca.graceverse` |
