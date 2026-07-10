"""Render an arbitrary PDF corpus to 300-dpi page images (pymupdf, no GPU).
Generalized from a sibling private-corpus renderer; unlike it, the slug is taken VERBATIM
from the filename stem (OSQF files are already `<slug>.pdf`) so pixel doc_ids
join back to osqf_wiki notes.

  SRC  semicolon-separated dir globs   (default: OSQF native+converted PDFs)
  OUT  output tile root                (default: ~/pixel_tiles_osqf)
  DPI  render dpi                      (default: 300)

Idempotent: skips a doc whose page count already matches.
  python render_corpus.py
"""
import fitz, os, glob

OSQF = "$OSQF_ARCHIVE_ROOT/_cache"
SRC = os.environ.get("SRC", f"{OSQF}/files/*/*.pdf;{OSQF}/pdf_converted/*.pdf")
OUT = os.path.expanduser(os.environ.get("OUT", "~/pixel_tiles_osqf"))
DPI = int(os.environ.get("DPI", "300"))


def main():
    os.makedirs(OUT, exist_ok=True)
    pdfs = sorted(p for pat in SRC.split(";") for p in glob.glob(pat))
    print(f"{len(pdfs)} PDFs to render @{DPI}dpi -> {OUT}", flush=True)
    rendered = skipped = pages = failed = 0
    for n, pdf in enumerate(pdfs):
        slug = os.path.splitext(os.path.basename(pdf))[0]
        d = f"{OUT}/{slug}"
        os.makedirs(d, exist_ok=True)
        try:
            doc = fitz.open(pdf)
        except Exception as e:
            print(f"  !! open failed {os.path.basename(pdf)}: {e}")
            failed += 1
            continue
        if len(glob.glob(f"{d}/*.png")) == len(doc) and len(doc) > 0:
            skipped += 1; pages += len(doc); doc.close(); continue
        for f in glob.glob(f"{d}/*.png"):
            os.remove(f)
        try:
            for i, pg in enumerate(doc):
                pg.get_pixmap(dpi=DPI).save(f"{d}/page_{i:03d}.png")
            rendered += 1; pages += len(doc)
        except Exception as e:
            print(f"  !! render failed {slug}: {e}")
            failed += 1
        doc.close()
        if n % 25 == 0:
            print(f"  [{n}/{len(pdfs)}] {pages} pages so far", flush=True)
    print(f"DONE: rendered {rendered}, skipped {skipped}, failed {failed}, total pages {pages}", flush=True)


if __name__ == "__main__":
    main()
