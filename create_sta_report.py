import os, glob, textwrap
from datetime import datetime

BASE = os.getcwd()
RUN = os.path.join(BASE, "openlane/water_tank_controller/runs/RUN_2026.10.10_02.11.36")
OUT = os.path.join(BASE, "STA_All_Corners.pdf")

reports = sorted(glob.glob(os.path.join(RUN, "reports/**/*.rpt"), recursive=True))
reports = [p for p in reports if "sta" in os.path.basename(p).lower()
           or "drc" in os.path.basename(p).lower()
           or "lvs" in os.path.basename(p).lower()]

pages = []
def add(title, body):
    pages.append((title, body))

add("Water Tank Controller — STA Report",
    "RTL-to-GDSII implementation using Verilog HDL\n\n"
    "Technology: Sky130\nFlow: OpenLane 1.0.2\n"
    "Run: RUN_2026.10.10_02.11.36\n"
    "Source: generated OpenLane reports\n\n"
    "This document organizes the available implementation timing reports. "
    "SS, TT and FF are not claimed unless confirmed by source report data.")

add("Report Scope",
    "The report includes synthesis and physical-design timing artifacts where available, "
    "maximum and minimum path reports, timing summaries, checks, power and skew reports, "
    "plus signoff artifacts. Report names and contents are retained as the source of truth.")

for p in reports:
    try:
        with open(p, errors="replace") as f:
            content = f.read().strip()
    except Exception:
        continue
    if not content:
        continue
    rel = os.path.relpath(p, BASE)
    lines = content.splitlines()
    chunks = [lines[i:i+48] for i in range(0, len(lines), 48)]
    for n, chunk in enumerate(chunks, 1):
        add(rel + (f" — part {n}" if len(chunks) > 1 else ""),
            "\n".join(chunk))

for title, body in [
    ("Corner interpretation",
     "MAX and MIN timing analyses are analysis modes, not by themselves proof of SS and FF process corners. "
     "The installed timing libraries and timing configuration must confirm process corners before assigning labels."),
    ("Setup and hold interpretation",
     "Setup and hold slack must be interpreted using the exact constraints and timing corner for each report. "
     "A nonnegative slack indicates no violation in that reported analysis; it does not prove all corners pass."),
    ("Physical design artifacts",
     "The final GDS and the available DRC/LVS reports are separate physical-design artifacts. "
     "This document does not replace the detailed signoff reports."),
    ("Submission checklist",
     "Include this PDF, original OpenLane timing reports, DRC/LVS reports, the final GDSII, "
     "and a KLayout screenshot. Verify that each claimed timing corner has a matching source report.")
]:
    add(title, body)

# Built-in minimal PDF writer: text-only pages, no third-party libraries.
def esc(s):
    return s.replace("\\", "\\\\").replace("(", "\\(").replace(")", "\\)")

objects = []
def obj(s):
    objects.append(s.encode("latin-1", "replace"))
    return len(objects)

font = obj("<< /Type /Font /Subtype /Type1 /BaseFont /Courier >>")
page_ids = []
for title, body in pages:
    lines = [title, "=" * min(len(title), 90), ""]
    for raw in body.splitlines():
        wrapped = textwrap.wrap(raw, width=88, replace_whitespace=False,
                                drop_whitespace=False) or [""]
        lines.extend(wrapped)
    # Split long source reports into readable pages.
    for start in range(0, len(lines), 48):
        block = lines[start:start+48]
        stream = "BT\n/F1 8 Tf\n40 800 Td\n11 TL\n"
        for line in block:
            stream += "(" + esc(line[:110]) + ") Tj\nT*\n"
        stream += "ET\n"
        content_id = obj("<< /Length %d >>\nstream\n%sendstream" %
                         (len(stream.encode("latin-1", "replace")), stream))
        page_id = obj("<< /Type /Page /Parent PAGESID /MediaBox [0 0 612 842] "
                      "/Resources << /Font << /F1 %d 0 R >> >> /Contents %d 0 R >>"
                      % (font, content_id))
        page_ids.append(page_id)

kids = " ".join(f"{i} 0 R" for i in page_ids)
pages_id = obj(f"<< /Type /Pages /Kids [{kids}] /Count {len(page_ids)} >>")
for i in page_ids:
    objects[i-1] = objects[i-1].replace(b"PAGESID", f"{pages_id} 0 R".encode())
catalog = obj(f"<< /Type /Catalog /Pages {pages_id} 0 R >>")

with open(OUT, "wb") as f:
    f.write(b"%PDF-1.4\n%\xe2\xe3\xcf\xd3\n")
    offsets = [0]
    for i, data in enumerate(objects, 1):
        offsets.append(f.tell())
        f.write(f"{i} 0 obj\n".encode())
        f.write(data)
        f.write(b"\nendobj\n")
    xref = f.tell()
    f.write(f"xref\n0 {len(objects)+1}\n".encode())
    f.write(b"0000000000 65535 f \n")
    for off in offsets[1:]:
        f.write(f"{off:010d} 00000 n \n".encode())
    f.write(f"trailer\n<< /Size {len(objects)+1} /Root {catalog} 0 R >>\n"
             f"startxref\n{xref}\n%%EOF\n".encode())

print("Created:", OUT)
print("Pages:", len(page_ids))
print("Source reports included:", len(reports))
