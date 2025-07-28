# Adobe India Hackathon 2025 - Challenge 1A: PDF Outline Extractor

## Overview

This solution extracts structured outlines from PDF documents, identifying document titles and hierarchical headings (H1, H2, H3, H4) with their corresponding page numbers. The output is formatted as JSON according to the specified schema.

## Approach

### Core Strategy
Our solution uses a **rule-based approach** combined with **font analysis** and **pattern matching** to identify document structure:

1. **Text Extraction**: Uses PyMuPDF's dict mode to extract text with detailed formatting information (font size, bold, position)
2. **Form Detection**: Identifies form documents (like application forms) that should have empty outlines
3. **Title Extraction**: Locates the document title by analyzing the largest, most prominent text in the upper portion of the first page
4. **Heading Detection**: Combines multiple heuristics to identify headings:
   - **Numbered patterns**: `1.`, `2.1`, `2.1.1` for hierarchical levels
   - **Section keywords**: Known section names like "Introduction", "References", "Table of Contents"
   - **Formatting cues**: Bold text, font size relative to body text
   - **Pattern recognition**: Appendix patterns, colon endings, phase indicators
5. **Level Classification**: Assigns H1/H2/H3/H4 levels based on numbering depth and content patterns

### Key Features
- **Fast Processing**: Optimized for speed, processes documents in 1-3 seconds
- **Robust Form Handling**: Correctly identifies form documents and returns empty outlines
- **Multiple Heading Types**: Handles numbered sections, named sections, and formatted headings
- **Accurate Hierarchy**: Maintains proper heading level relationships

## Libraries Used

- **PyMuPDF (fitz)**: PDF parsing and text extraction with formatting information
- **re**: Regular expressions for pattern matching
- **json**: JSON file output
- **pathlib**: File system operations
- **collections.Counter**: Font size analysis

### Why PyMuPDF?
- Lightweight (~10MB) and fast
- Provides detailed formatting information (font size, bold, positioning)
- No external dependencies
- CPU-only processing
- Reliable text extraction across diverse PDF formats

## Algorithm Details

### 1. Text Extraction

### 2. Heading Detection Hierarchy
1. **Numbered patterns** (highest priority): `1.`, `2.1`, `2.1.1`
2. **Known section names**: "References", "Acknowledgements", etc.
3. **Appendix patterns**: "Appendix A:", "Appendix B:", etc.
4. **Colon endings**: Short text ending with `:` 
5. **Phase patterns**: "Phase I:", "Phase II:", etc.
6. **Font-based**: Bold text significantly larger than body text

### 3. Level Assignment Logic
- `X.Y.Z` → H3 (deepest numbering)
- `X.Y` → H2 (sub-sections)
- `X.` → H1 (main sections)
- Known section names → H1
- Colon patterns → H3 (usually)
- "For each..." patterns → H4

## Project Structure


## Performance Characteristics

- **Speed**: ~1-3 seconds per PDF (50 pages)
- **Memory**: <100MB RAM usage
- **Model Size**: No ML models used
- **Dependencies**: Minimal (only PyMuPDF)
- **Accuracy**: Optimized for the provided document types

## Design Decisions

1. **Rule-based over ML**: Chose pattern matching for speed and reliability within constraints
2. **Multiple detection methods**: Combined approach handles various document styles
3. **Form detection**: Special handling for application forms that shouldn't have outlines
4. **Minimal dependencies**: Only essential libraries to stay under size limits
5. **Fast execution**: Optimized for the 10-second constraint

## Constraints Compliance

- ✅ **Execution time**: ≤10 seconds for 50-page PDF
- ✅ **Model size**: No models used (well under 200MB limit)
- ✅ **Network access**: Completely offline operation
- ✅ **Runtime**: CPU-only on AMD64 architecture
- ✅ **Memory**: Efficient processing within 16GB limit

## Testing

The solution has been tested on diverse document types including:
- Technical documentation with numbered sections
- Business proposals with appendices
- Form documents (correctly identified as having no outline)
- Documents with mixed formatting styles

---

**Note**: This solution prioritizes speed and reliability over maximum accuracy, making it well-suited for the hackathon's performance constraints while maintaining reasonable extraction quality.
