# Pandoc Professional ODT-to-PDF Template

A clean, professional template and workflow configuration to convert Markdown documents into beautifully styled PDFs using Pandoc and LibreOffice.

## Features

- **Professional Typography & Layout:** Leverages a custom ODT reference document to control fonts, headings, margins, and paragraph spacing.
- **Markdown-First:** Write your content cleanly in Markdown and let Pandoc handle the structural layout.
- **Automated Pipeline:** Easily build your documents using a simple Makefile.

## Prerequisites

Make sure you have the following tools installed on your system:
- **Pandoc** (v2.11 or higher recommended)
- **LibreOffice** (used in headless mode by Pandoc to process the ODT styles)
- **A PDF Engine** (such as XeLaTeX, LuaLaTeX, or Typst depending on your setup)

## Project Structure

```text
├── template/
│   └── custom-style.odt   # Reference ODT stylesheet
├── examples/
│   ├── input.md           # Sample Markdown source
│   └── output.pdf         # Generated PDF result
├── Makefile               # Build automation script
└── README.md
