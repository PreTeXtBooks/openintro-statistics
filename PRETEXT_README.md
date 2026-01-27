# OpenIntro Statistics - PreTeXt Conversion

This directory contains the PreTeXt version of OpenIntro Statistics, converted from the original LaTeX source.

## Project Structure

```
openintro-statistics-1/
├── project.ptx                 # PreTeXt project configuration
├── publication/
│   └── publication.ptx         # Publication settings for HTML/PDF output
├── source/
│   ├── main.ptx               # Main book file
│   ├── ch01.ptx               # Chapter 1 (CONVERTED - example)
│   ├── ch02.ptx through ch09.ptx  # Chapters 2-9 (placeholders)
│   └── images/                # Images directory
└── output/                    # Generated output (HTML, PDF)
```

## Current Status

### ✅ Completed
- Project configuration (`project.ptx`)
- Main book structure (`source/main.ptx`)
- **Chapter 1 fully converted** with:
  - Section 1.1: Case study (stents and strokes) - COMPLETE
  - Section 1.2: Data basics - COMPLETE with subsections
  - Exercises integrated into sections
  - Tables and guided practice exercises
  - Proper PreTeXt markup for all elements

### 🔄 In Progress
- Chapters 2-9 have placeholder structures created
- Images need to be organized into `source/images/` directory

## How to Continue the Conversion

### Step 1: Convert Remaining Sections in Chapter 1

The following sections still need conversion:
- `ch_intro_to_data/TeX/sampling_principles_and_strategies.tex`
- `ch_intro_to_data/TeX/experiments.tex`
- `ch_intro_to_data/TeX/review_exercises.tex`

Follow the pattern established in the existing sections.

### Step 2: Convert Other Chapters

Each chapter follows a similar pattern:
1. Read the LaTeX source from `ch_[name]/TeX/ch_[name].tex`
2. Identify sections using `\section{}` commands
3. Convert to PreTeXt XML structure

### Step 3: Convert Images

Images are located in chapter folders under `figures/`:
- Copy relevant images to `source/images/ch_[name]/`
- Convert formats if needed (preferably PNG or SVG)
- Update image references in PreTeXt files

## LaTeX to PreTeXt Conversion Guide

### Common Conversions

| LaTeX | PreTeXt |
|-------|---------|
| `\section{Title}` | `<section xml:id="sec-id"><title>Title</title>` |
| `\subsection{Title}` | `<subsection xml:id="subsec-id"><title>Title</title>` |
| `\emph{text}` | `<em>text</em>` |
| `\textbf{text}` | `<alert>text</alert>` or `<term>text</term>` |
| `\term{word}` | `<term>word</term>` |
| `\index{topic}` | `<idx>topic</idx>` |
| `\label{key}` | `xml:id="key"` attribute |
| `\ref{key}` | `<xref ref="key"/>` |
| `$x^2$` | `<m>x^2</m>` (inline math) |
| `$$x = \frac{-b}{2a}$$` | `<me>x = \frac{-b}{2a}</me>` (display math) |

### Exercises

LaTeX `\eoce{}` exercises convert to:
```xml
<exercise xml:id="ex-id">
  <title>Exercise Title</title>
  <statement>
    <p>Exercise content...</p>
  </statement>
  <solution>
    <p>Solution content (optional)...</p>
  </solution>
</exercise>
```

### Tables

LaTeX `tabular` environments convert to:
```xml
<table xml:id="table-id">
  <title>Table Title</title>
  <tabular>
    <row header="yes" bottom="medium">
      <cell>Header 1</cell>
      <cell>Header 2</cell>
    </row>
    <row>
      <cell>Data 1</cell>
      <cell>Data 2</cell>
    </row>
  </tabular>
</table>
```

### Figures/Images

```xml
<figure xml:id="fig-id">
  <caption>Figure caption</caption>
  <image source="images/ch_name/figure.png" width="70%">
    <description>Accessible description for screen readers</description>
  </image>
</figure>
```

### Lists

Unordered lists:
```xml
<p>
  <ul>
    <li><p>Item 1</p></li>
    <li><p>Item 2</p></li>
  </ul>
</p>
```

Ordered lists:
```xml
<p>
  <ol marker="1.">
    <li><p>Item 1</p></li>
    <li><p>Item 2</p></li>
  </ol>
</p>
```

## Building the Book

### Prerequisites

Install PreTeXt CLI:
```bash
pip install pretextbook
```

### Build HTML Version

```bash
pretext build web
```

Output will be in `output/html/`

### Build PDF Version

```bash
pretext build pdf
```

Output will be in `output/pdf/`

### View the HTML Book

```bash
pretext view web
```

This will start a local server and open the book in your browser.

## Tips for Conversion

1. **Start with structure**: Convert section headings and basic structure first
2. **Then add content**: Fill in paragraphs, preserving LaTeX math notation
3. **Handle special elements**: Convert exercises, tables, figures systematically
4. **Test frequently**: Build the HTML output often to catch errors early
5. **Preserve math**: LaTeX math notation works in PreTeXt - keep `\frac{}`, `\sum`, etc.
6. **Add descriptions**: Every image needs a `<description>` for accessibility
7. **Use xml:id consistently**: Every section, exercise, table, figure needs a unique xml:id

## Custom LaTeX Macros

The original book uses custom macros like:
- `\data{name}` - dataset names → `<c>name</c>` (code formatting)
- `\var{name}` - variable names → `<c>name</c>`
- `\resp{text}` - response values → `<c>text</c>`
- `\term{word}` - definitions → `<term>word</term>`
- `\termsub{word}{index}` - terms with index → `<term>word</term><idx>index</idx>`

## Resources

- [PreTeXt Documentation](https://pretextbook.org/documentation.html)
- [PreTeXt Guide](https://pretextbook.org/doc/guide/html/)
- [PreTeXt Author's Guide](https://pretextbook.org/doc/author-guide/html/)
- [OpenIntro Statistics Original](https://www.openintro.org/book/os/)

## License

This work maintains the original Creative Commons Attribution-ShareAlike 3.0 United States License from the OpenIntro Statistics textbook.

## Next Steps

1. ✅ Review Chapter 1 conversion as a template
2. Continue converting remaining sections in Chapter 1
3. Move to Chapter 2 (Summarizing data)
4. Organize and convert images as needed
5. Handle exercises and solutions systematically
6. Convert appendices (data sets, statistical tables)
7. Test builds frequently
8. Add any custom styling or features as needed

## Questions or Issues?

The conversion follows standard PreTeXt patterns. Refer to the PreTeXt documentation for specific markup questions, or examine the completed portions of Chapter 1 for examples.
