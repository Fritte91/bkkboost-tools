# BkkBoost Tools — Build Plan

## What is this?

A collection of 47 free browser-based utility tools under the BkkBoost brand. Every tool runs 100% client-side (no backend, no uploads to servers). Currently runs locally via `start.sh`; later deploys to Cloudflare Pages as a free public site that drives traffic to bkkboost.com.

---

## File structure

```
BkkBoost-Tools/
├── index.html              ← Landing page (category grid + search)
├── shared.css              ← Design system (all tools import this)
├── start.sh                ← Local dev server launcher
├── models/
│   └── u2netp.onnx         ← AI model for BG remover (~4.7MB)
└── tools/
    ├── bg-remover.html
    ├── image-compressor.html
    ├── image-resizer.html
    ├── image-converter.html
    ├── image-cropper.html
    ├── image-to-base64.html
    ├── bulk-image-rename.html
    ├── pdf-compressor.html
    ├── merge-pdf.html
    ├── split-pdf.html
    ├── pdf-to-images.html
    ├── images-to-pdf.html
    ├── pdf-page-rotator.html
    ├── qr-generator.html
    ├── qr-reader.html
    ├── barcode-generator.html
    ├── word-counter.html
    ├── case-converter.html
    ├── lorem-generator.html
    ├── markdown-preview.html
    ├── text-diff.html
    ├── find-replace.html
    ├── color-picker.html
    ├── palette-from-image.html
    ├── gradient-generator.html
    ├── contrast-checker.html
    ├── json-formatter.html
    ├── json-csv.html
    ├── base64.html
    ├── url-encoder.html
    ├── hash-generator.html
    ├── uuid-generator.html
    ├── regex-tester.html
    ├── html-entity.html
    ├── jwt-decoder.html
    ├── timestamp-converter.html
    ├── csv-viewer.html
    ├── excel-to-csv.html
    ├── spreadsheet-viewer.html
    ├── unit-converter.html
    ├── calculator.html
    ├── pomodoro.html
    ├── screen-ruler.html
    ├── favicon-generator.html
    ├── og-preview.html
    ├── password-generator.html
    └── invoice-generator.html
```

---

## Design system (shared.css)

All tools MUST import shared.css and follow this design system exactly. No tool should define its own color variables or fonts.

### Fonts
```
Google Fonts import:
  DM Sans: 400, 500, 600, 700
  DM Mono: 400, 500
```

### CSS variables
```css
:root {
  --navy: #1B2A4A;
  --orange: #E8531A;
  --orange-light: #FF6B2B;
  --bg: #0D0D12;
  --surface: #16161E;
  --surface2: #1E1E28;
  --surface3: #252530;
  --border: rgba(255,255,255,0.07);
  --border2: rgba(255,255,255,0.12);
  --text: #F0F0F0;
  --text2: #9090A0;
  --text3: #606070;
  --accent: #E8531A;
  --green: #22C55E;
  --red: #EF4444;
  --blue: #3B82F6;
  --yellow: #F59E0B;
  --radius: 10px;
  --radius-sm: 6px;
}
```

### Base styles (in shared.css)
```css
* { box-sizing: border-box; margin: 0; padding: 0; }
body {
  font-family: 'DM Sans', sans-serif;
  background: var(--bg);
  color: var(--text);
  min-height: 100vh;
}
```

### Shared components

**Header bar** (every page):
```html
<header class="toolbar">
  <a href="../index.html" class="back-link">← All Tools</a>
  <div class="logo">Bkk<span>Boost</span></div>
  <div class="logo-tag">TOOLS</div>
</header>
```
- Height: 52px
- Background: var(--surface)
- Border-bottom: 1px solid var(--border)
- Logo: "Bkk" in white, "Boost" in var(--orange)
- "TOOLS" in DM Mono, uppercase, 10px, var(--text3)
- Back link on the left, logo centered or on the right

**Footer** (every page):
```html
<footer class="footer">
  BkkBoost Tools · 100% client-side · Your files never leave your device
</footer>
```
- Font-size: 12px, color: var(--text3), text-align: center
- Padding: 20px, border-top: 1px solid var(--border)

**Primary button**:
```css
.btn-primary {
  background: var(--orange);
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: var(--radius);
  font-family: 'DM Sans', sans-serif;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
}
.btn-primary:hover { background: var(--orange-light); }
.btn-primary:disabled { opacity: 0.4; cursor: not-allowed; }
```

**Secondary button**:
```css
.btn-secondary {
  background: var(--surface2);
  color: var(--text);
  border: 1px solid var(--border2);
  /* same padding/radius/font as primary */
}
.btn-secondary:hover { background: var(--surface3); }
```

**Drop zone** (for file-based tools):
```css
.dropzone {
  border: 2px dashed var(--border2);
  border-radius: var(--radius);
  padding: 48px 24px;
  text-align: center;
  cursor: pointer;
  transition: all 0.2s;
}
.dropzone:hover,
.dropzone.dragover {
  border-color: var(--orange);
  background: rgba(232,83,26,0.04);
}
```

**Card** (used on landing page):
```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius);
  padding: 20px;
  transition: all 0.2s;
}
.card:hover {
  border-color: var(--border2);
  background: var(--surface2);
}
```

**Input fields**:
```css
input, select, textarea {
  background: var(--surface2);
  border: 1px solid var(--border2);
  border-radius: var(--radius-sm);
  color: var(--text);
  font-family: 'DM Sans', sans-serif;
  font-size: 14px;
  padding: 10px 12px;
  outline: none;
  width: 100%;
}
input:focus, textarea:focus {
  border-color: var(--orange);
}
```

**Category badge**:
```css
.badge {
  display: inline-block;
  padding: 3px 10px;
  border-radius: 20px;
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.03em;
}
```
Badge colors per category:
- Image: background rgba(34,197,94,0.12), color #22C55E
- PDF: background rgba(239,68,68,0.12), color #EF4444
- QR: background rgba(59,130,246,0.12), color #3B82F6
- Text: background rgba(245,158,11,0.12), color #F59E0B
- Color: background rgba(168,85,247,0.12), color #A855F7
- Developer: background rgba(20,184,166,0.12), color #14B8A6
- Data: background rgba(232,83,26,0.12), color #E8531A
- Utility: background rgba(255,255,255,0.08), color var(--text2)

---

## Landing page (index.html)

### Layout
```
┌─────────────────────────────────────────────┐
│  HEADER: Logo left, tagline right           │
├─────────────────────────────────────────────┤
│                                             │
│  Hero: "BkkBoost Tools"                     │
│  Subtitle: "47 free browser tools..."       │
│                                             │
│  [ 🔍 Search tools...                    ]  │
│                                             │
│  [All] [Image] [PDF] [QR] [Text] [Color]    │
│  [Developer] [Data] [Utilities]             │
│                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │ 🖼 BG    │  │ 🖼 Image │  │ 🖼 Image │  │
│  │ Remover  │  │ Compress │  │ Resizer  │  │
│  │ Remove   │  │ Reduce   │  │ Resize   │  │
│  │ bg from  │  │ file     │  │ to any   │  │
│  │ photos   │  │ size     │  │ dimension│  │
│  │ [Image]  │  │ [Image]  │  │ [Image]  │  │
│  └──────────┘  └──────────┘  └──────────┘  │
│                                             │
│  ... more cards in 3-column grid ...        │
│                                             │
├─────────────────────────────────────────────┤
│  FOOTER                                     │
└─────────────────────────────────────────────┘
```

### Behavior
- Search bar: filters cards in real-time by tool name and description
- Category tabs: filter cards by category, "All" shows everything
- Cards are clickable → navigate to tools/{tool}.html
- Grid: 3 columns on desktop, 2 on tablet, 1 on mobile
- Each card shows: emoji icon, tool name, one-line description, category badge

### Card data (all 47 tools)

```javascript
const tools = [
  // IMAGE TOOLS
  { id: "bg-remover", name: "BG Remover", desc: "Remove background from photos using AI", cat: "Image", icon: "✂️" },
  { id: "image-compressor", name: "Image Compressor", desc: "Reduce image file size with quality control", cat: "Image", icon: "📦" },
  { id: "image-resizer", name: "Image Resizer", desc: "Resize to custom or social media dimensions", cat: "Image", icon: "↔️" },
  { id: "image-converter", name: "Image Converter", desc: "Convert between PNG, JPG, WebP, GIF", cat: "Image", icon: "🔄" },
  { id: "image-cropper", name: "Image Cropper", desc: "Crop with freeform or preset aspect ratios", cat: "Image", icon: "🔲" },
  { id: "image-to-base64", name: "Image to Base64", desc: "Encode images to Base64 data strings", cat: "Image", icon: "🔣" },
  { id: "bulk-image-rename", name: "Bulk Image Rename", desc: "Rename and download multiple images at once", cat: "Image", icon: "📁" },

  // PDF TOOLS
  { id: "pdf-compressor", name: "PDF Compressor", desc: "Reduce PDF file size", cat: "PDF", icon: "📄" },
  { id: "merge-pdf", name: "Merge PDFs", desc: "Combine multiple PDFs into one file", cat: "PDF", icon: "📑" },
  { id: "split-pdf", name: "Split PDF", desc: "Extract specific pages from a PDF", cat: "PDF", icon: "✂️" },
  { id: "pdf-to-images", name: "PDF to Images", desc: "Convert PDF pages to PNG or JPG", cat: "PDF", icon: "🖼" },
  { id: "images-to-pdf", name: "Images to PDF", desc: "Combine images into a single PDF", cat: "PDF", icon: "📄" },
  { id: "pdf-page-rotator", name: "PDF Page Rotator", desc: "Rotate individual pages in a PDF", cat: "PDF", icon: "🔃" },

  // QR & BARCODE
  { id: "qr-generator", name: "QR Code Generator", desc: "Generate QR codes for URLs, text, WiFi, vCard", cat: "QR", icon: "📱" },
  { id: "qr-reader", name: "QR Code Reader", desc: "Read QR codes from camera or image upload", cat: "QR", icon: "📷" },
  { id: "barcode-generator", name: "Barcode Generator", desc: "Generate EAN, UPC, Code128, and more", cat: "QR", icon: "▮▯▮" },

  // TEXT & CONTENT
  { id: "word-counter", name: "Word Counter", desc: "Count words, characters, sentences, reading time", cat: "Text", icon: "🔢" },
  { id: "case-converter", name: "Case Converter", desc: "Convert between UPPER, lower, Title, camelCase", cat: "Text", icon: "Aa" },
  { id: "lorem-generator", name: "Lorem Ipsum Generator", desc: "Generate placeholder text by paragraphs or words", cat: "Text", icon: "📝" },
  { id: "markdown-preview", name: "Markdown Preview", desc: "Live editor with rendered HTML preview", cat: "Text", icon: "📖" },
  { id: "text-diff", name: "Text Diff Checker", desc: "Compare two texts and highlight differences", cat: "Text", icon: "⇔" },
  { id: "find-replace", name: "Find & Replace", desc: "Find and replace text with regex support", cat: "Text", icon: "🔍" },

  // COLOR & DESIGN
  { id: "color-picker", name: "Color Picker", desc: "Pick and convert between HEX, RGB, HSL", cat: "Color", icon: "🎨" },
  { id: "palette-from-image", name: "Palette from Image", desc: "Extract dominant colors from any image", cat: "Color", icon: "🖌" },
  { id: "gradient-generator", name: "Gradient Generator", desc: "Create CSS gradients with live preview", cat: "Color", icon: "🌈" },
  { id: "contrast-checker", name: "Contrast Checker", desc: "Check WCAG accessibility color contrast", cat: "Color", icon: "👁" },

  // DEVELOPER TOOLS
  { id: "json-formatter", name: "JSON Formatter", desc: "Format, validate, and minify JSON", cat: "Developer", icon: "{}" },
  { id: "json-csv", name: "JSON ↔ CSV", desc: "Convert between JSON and CSV formats", cat: "Developer", icon: "⇄" },
  { id: "base64", name: "Base64 Encode/Decode", desc: "Encode or decode Base64 strings", cat: "Developer", icon: "🔐" },
  { id: "url-encoder", name: "URL Encode/Decode", desc: "Encode or decode URL components", cat: "Developer", icon: "🔗" },
  { id: "hash-generator", name: "Hash Generator", desc: "Generate MD5, SHA-1, SHA-256 hashes", cat: "Developer", icon: "#️" },
  { id: "uuid-generator", name: "UUID Generator", desc: "Generate v4 UUIDs in bulk", cat: "Developer", icon: "🆔" },
  { id: "regex-tester", name: "Regex Tester", desc: "Test regular expressions with live highlighting", cat: "Developer", icon: ".*" },
  { id: "html-entity", name: "HTML Entity Encoder", desc: "Encode and decode HTML entities", cat: "Developer", icon: "&;" },
  { id: "jwt-decoder", name: "JWT Decoder", desc: "Decode and inspect JWT tokens", cat: "Developer", icon: "🎟" },
  { id: "timestamp-converter", name: "Timestamp Converter", desc: "Convert between Unix timestamps and dates", cat: "Developer", icon: "⏱" },

  // FILE & DATA
  { id: "csv-viewer", name: "CSV Viewer & Editor", desc: "View and edit CSV files in a table", cat: "Data", icon: "📊" },
  { id: "excel-to-csv", name: "Excel to CSV", desc: "Convert .xlsx files to CSV format", cat: "Data", icon: "📗" },
  { id: "spreadsheet-viewer", name: "Spreadsheet Viewer", desc: "Preview .xlsx files without Excel", cat: "Data", icon: "📋" },

  // EVERYDAY UTILITIES
  { id: "unit-converter", name: "Unit Converter", desc: "Convert length, weight, temperature, and more", cat: "Utility", icon: "📏" },
  { id: "calculator", name: "Scientific Calculator", desc: "Calculator with scientific functions", cat: "Utility", icon: "🧮" },
  { id: "pomodoro", name: "Pomodoro Timer", desc: "Focus timer with work and break intervals", cat: "Utility", icon: "🍅" },
  { id: "screen-ruler", name: "Screen Ruler", desc: "Measure pixel distances on screen", cat: "Utility", icon: "📐" },
  { id: "favicon-generator", name: "Favicon Generator", desc: "Generate .ico and all sizes from one image", cat: "Utility", icon: "🌐" },
  { id: "og-preview", name: "OG Preview", desc: "Preview how links appear on social media", cat: "Utility", icon: "🔖" },
  { id: "password-generator", name: "Password Generator", desc: "Generate secure random passwords", cat: "Utility", icon: "🔑" },
  { id: "invoice-generator", name: "Invoice Generator", desc: "Create and download PDF invoices", cat: "Utility", icon: "🧾" },
];
```

---

## Tool page template

Every tool page follows this exact structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{Tool Name} — BkkBoost Tools</title>
  <link rel="stylesheet" href="../shared.css">
  <!-- Tool-specific CDN libraries go here -->
</head>
<body>

  <!-- HEADER (same on every tool) -->
  <header class="toolbar">
    <a href="../index.html" class="back-link">← All Tools</a>
    <div class="toolbar-brand">
      <div class="logo">Bkk<span>Boost</span></div>
      <div class="logo-tag">TOOLS</div>
    </div>
  </header>

  <!-- TOOL CONTENT -->
  <main class="tool-container">
    <div class="tool-header">
      <h1>{Tool Name}</h1>
      <p class="tool-desc">{One-line description}</p>
    </div>

    <!-- Tool-specific UI goes here -->

  </main>

  <!-- FOOTER (same on every tool) -->
  <footer class="footer">
    BkkBoost Tools · 100% client-side · Your files never leave your device
  </footer>

  <!-- Tool-specific scripts -->
</body>
</html>
```

### Tool layout width
- Max-width: 900px, centered
- Padding: 24px sides, 32px top, 48px bottom

---

## Tool UX patterns

### Pattern A: File input → process → download
Used by: BG Remover, Image Compressor, Image Resizer, Image Converter, Image Cropper, PDF tools, Favicon Generator

```
┌─────────────────────────────────┐
│  Tool Name                      │
│  Description                    │
│                                 │
│  ┌───────────────────────────┐  │
│  │                           │  │
│  │    Drop files here        │  │
│  │    or click to browse     │  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌── Settings (if any) ──────┐  │
│  │  Quality: ████░░░░ 75%    │  │
│  │  Format:  [PNG ▼]         │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌─ Original ─┐  ┌─ Result ──┐ │
│  │             │  │           │ │
│  │   preview   │  │  preview  │ │
│  │             │  │           │ │
│  │  2.4 MB     │  │  340 KB   │ │
│  └─────────────┘  └───────────┘ │
│                                 │
│  [⬇ Download]  [🔄 New Image]  │
│                                 │
└─────────────────────────────────┘
```

### Pattern B: Text input → live output
Used by: Word Counter, Case Converter, JSON Formatter, Base64, URL Encoder, Hash Generator, HTML Entity, Find & Replace

```
┌─────────────────────────────────┐
│  Tool Name                      │
│  Description                    │
│                                 │
│  ┌─ Input ────────────────────┐ │
│  │                            │ │
│  │  (textarea or code input)  │ │
│  │                            │ │
│  └────────────────────────────┘ │
│                                 │
│  ┌─ Output ───────────────────┐ │
│  │                            │ │
│  │  (result, updates live)    │ │
│  │                            │ │
│  └────────────────────────────┘ │
│                                 │
│  [📋 Copy to clipboard]        │
│                                 │
└─────────────────────────────────┘
```

### Pattern C: Generator / interactive
Used by: QR Generator, UUID Generator, Lorem Ipsum, Password Generator, Gradient Generator, Color Picker, Calculator, Unit Converter, Pomodoro, Timestamp Converter

```
┌─────────────────────────────────┐
│  Tool Name                      │
│  Description                    │
│                                 │
│  ┌─ Controls ────────────────┐  │
│  │  Input fields, sliders,   │  │
│  │  toggles, dropdowns       │  │
│  └───────────────────────────┘  │
│                                 │
│  ┌─ Result ──────────────────┐  │
│  │                           │  │
│  │  Generated output         │  │
│  │  (QR image, text, etc)    │  │
│  │                           │  │
│  └───────────────────────────┘  │
│                                 │
│  [⬇ Download] or [📋 Copy]     │
│                                 │
└─────────────────────────────────┘
```

### Pattern D: Side-by-side comparison
Used by: Text Diff, Markdown Preview, Contrast Checker

```
┌─────────────────────────────────┐
│  Tool Name                      │
│  Description                    │
│                                 │
│  ┌─ Left ──────┐ ┌─ Right ───┐ │
│  │             │ │           │  │
│  │  Input A    │ │  Input B  │  │
│  │             │ │  / Output │  │
│  │             │ │           │  │
│  └─────────────┘ └───────────┘  │
│                                 │
│  [Action button]                │
│                                 │
└─────────────────────────────────┘
```

---

## CDN libraries to use

Each tool should use these specific libraries (load from CDN, no npm):

| Tool | Library | CDN |
|------|---------|-----|
| BG Remover | onnxruntime-web | cdn.jsdelivr.net/npm/onnxruntime-web@1.17.3 |
| PDF tools | pdf-lib | cdn.jsdelivr.net/npm/pdf-lib |
| PDF to Images | pdfjs-dist | cdn.jsdelivr.net/npm/pdfjs-dist |
| QR Generator | qrcode.js | cdn.jsdelivr.net/npm/qrcodejs |
| QR Reader | jsQR | cdn.jsdelivr.net/npm/jsqr |
| Barcode | JsBarcode | cdn.jsdelivr.net/npm/jsbarcode |
| Excel/CSV | SheetJS (xlsx) | cdn.jsdelivr.net/npm/xlsx |
| Markdown | marked.js | cdn.jsdelivr.net/npm/marked |
| Text Diff | diff (npm) | cdn.jsdelivr.net/npm/diff |
| Hash | Web Crypto API | Built-in (no CDN) |
| Invoice PDF | jsPDF | cdn.jsdelivr.net/npm/jspdf |
| Image Cropper | Cropper.js | cdn.jsdelivr.net/npm/cropperjs |

Tools NOT needing any library (pure JS):
- Word Counter, Case Converter, Lorem Ipsum, Find & Replace
- Color Picker, Gradient Generator, Contrast Checker
- Base64, URL Encoder, UUID Generator, HTML Entity, JWT Decoder, Timestamp Converter
- Password Generator, Unit Converter, Calculator, Pomodoro, Screen Ruler
- Image Compressor (Canvas API), Image Resizer (Canvas API), Image Converter (Canvas API)
- Image to Base64 (FileReader API)
- Palette from Image (Canvas API)
- OG Preview (fetch + parse)
- Favicon Generator (Canvas API)

---

## Build order (suggested batches)

### Batch 0: Foundation
1. shared.css — the design system
2. index.html — landing page with all 47 cards, search, category tabs
3. start.sh — local server launcher
4. Move existing bg-remover into tools/bg-remover.html, update to use shared.css

### Batch 1: Quick wins (pure JS, no libraries)
5. Word Counter
6. Case Converter
7. Password Generator
8. UUID Generator
9. Lorem Ipsum Generator
10. Base64 Encode/Decode
11. URL Encode/Decode
12. HTML Entity Encoder
13. Timestamp Converter
14. Unit Converter

### Batch 2: Image tools (Canvas API)
15. Image Compressor
16. Image Resizer
17. Image Converter
18. Image Cropper (needs Cropper.js)
19. Image to Base64
20. Bulk Image Rename
21. Palette from Image
22. Favicon Generator

### Batch 3: Developer tools
23. JSON Formatter
24. Regex Tester
25. JWT Decoder
26. Hash Generator
27. JSON ↔ CSV

### Batch 4: Text tools
28. Markdown Preview (needs marked.js)
29. Text Diff Checker (needs diff lib)
30. Find & Replace

### Batch 5: Color & design tools
31. Color Picker / Converter
32. Gradient Generator
33. Contrast Checker

### Batch 6: PDF tools (needs pdf-lib + pdfjs-dist)
34. Merge PDFs
35. Split PDF
36. PDF to Images
37. Images to PDF
38. PDF Page Rotator
39. PDF Compressor

### Batch 7: QR & data tools
40. QR Code Generator
41. QR Code Reader
42. Barcode Generator
43. CSV Viewer & Editor
44. Excel to CSV
45. Spreadsheet Viewer

### Batch 8: Complex utilities
46. Scientific Calculator
47. Pomodoro Timer
48. Screen Ruler
49. OG Preview
50. Invoice Generator

---

## Rules for Claude Code

1. Every tool is a SINGLE standalone .html file inside /tools/
2. Every tool imports ../shared.css as its base styles
3. Tool-specific CSS goes in a <style> tag inside the tool's HTML
4. No build step, no bundler, no npm install — just HTML files with CDN scripts
5. All processing happens client-side in the browser
6. Every file drop zone must support both drag-and-drop AND click-to-browse
7. Every download button must use the original filename + suffix (e.g., "photo-compressed.jpg")
8. Show file sizes before/after when processing files (formatted: KB, MB)
9. Show error messages in a styled error bar, never alert()
10. All tools must be responsive (work on mobile)
11. Use the BkkBoost orange (#E8531A) as the primary accent, never another color
12. The back link "← All Tools" must always go to ../index.html
13. No external API calls — everything runs in the browser
14. For the BG Remover specifically: load model from ../models/u2netp.onnx (local file)

---

## Landing page behavior spec

- On load: show all 47 tool cards in a 3-column grid
- Search bar: keyup listener, filters cards whose name or description contains the query (case insensitive)
- Category tabs: click sets active tab, filters cards by category. "All" shows everything
- If search + category filter yields 0 results, show "No tools found" message
- Each card links to tools/{id}.html
- Cards should have subtle hover animation (slight lift + border highlight)
- The page title is "BkkBoost Tools — Free Browser-Based Utilities"
- Meta description: "47 free online tools that run entirely in your browser. Image compression, PDF merge, QR codes, JSON formatting, and more. No uploads, no signups."
