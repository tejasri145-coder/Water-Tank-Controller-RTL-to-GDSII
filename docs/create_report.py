from pathlib import Path

root = Path("/home/vsduser/Desktop/Water-Tank-Controller-RTL-to-GDSII")
docs = root / "docs"
output = docs / "Water_Tank_Controller_Final_Report.pdf"

lines = [
"WATER TANK CONTROLLER",
"RTL-to-GDSII FINAL PROJECT REPORT",
"",
"Design language: Verilog HDL",
"Physical design flow: OpenLane",
"",
"1. PROJECT OVERVIEW",
"Digital water tank controller design described using Verilog HDL.",
"The RTL is intended for simulation and physical implementation.",
"",
"2. PROJECT FILE STATUS"
]

files = [
("RTL source", root / "rtl/water_tank_controller.v"),
("Testbench", root / "simulation/tb_water_tank_controller.v"),
("Waveform", root / "simulation/water_tank.vcd"),
("STA corners report", root / "docs/STA_All_Corners.pdf"),
("Results summary", root / "docs/results_summary.txt")
]

for name, path in files:
status = "Available" if path.exists() else "Not found"
lines.append(name + ": " + status)

lines.extend(["", "3. RESULTS SUMMARY"])
summary = docs / "results_summary.txt"
if summary.exists():
lines.extend(summary.read_text().splitlines()[:20])
else:
lines.append("Results summary not found.")

lines.extend([
"",
"4. SIGNOFF NOTES",
"Verify actual timing, DRC and LVS reports before submission.",
"Missing reports must not be treated as zero violations.",
"",
"5. RTL SOURCE EXCERPT"
])

rtl = root / "rtl/water_tank_controller.v"
if rtl.exists():
lines.extend(rtl.read_text().splitlines()[:15])
else:
lines.append("RTL source not found.")

def escape(text):
text = text.encode("ascii", "replace").decode("ascii")
return text.replace("\", "\\").replace("(", "\(").replace(")", "\)")

lines = [line[:95] for line in lines]
pages = [lines[i:i + 48] for i in range(0, len(lines), 48)]
objects = [
"<< /Type /Catalog /Pages 2 0 R >>",
"<< /Type /Pages /Kids [" + " ".join(
str(5 + 2 * i) + " 0 R" for i in range(len(pages))
) + "] /Count " + str(len(pages)) + " >>",
"<< /Type /Font /Subtype /Type1 /BaseFont /Courier >>"
]

for i, page in enumerate(pages):
stream = "BT /F1 9 Tf 45 800 Td 12 TL "
for line in page:
stream += "(" + escape(line) + ") Tj T* "
stream += "ET"
objects.append("<< /Length " + str(len(stream)) +
" >>\nstream\n" + stream + "\nendstream")
objects.append(
"<< /Type /Page /Parent 2 0 R /MediaBox [0 0 595 842] "
"/Resources << /Font << /F1 3 0 R >> >> /Contents " +
str(4 + 2 * i) + " 0 R >>"
)

pdf = bytearray(b"%PDF-1.4\n")
offsets = [0]
for number, obj in enumerate(objects, 1):
offsets.append(len(pdf))
pdf.extend((str(number) + " 0 obj\n" + obj +
"\nendobj\n").encode("ascii"))

xref = len(pdf)
pdf.extend(("xref\n0 " + str(len(objects) + 1) +
"\n0000000000 65535 f \n").encode("ascii"))
for offset in offsets[1:]:
pdf.extend(("%010d 00000 n \n" % offset).encode("ascii"))
pdf.extend(("trailer\n<< /Size " + str(len(objects) + 1) +
" /Root 1 0 R >>\nstartxref\n" + str(xref) +
"\n%%EOF\n").encode("ascii"))

output.write_bytes(pdf)
print("Report created:", output)
print("PDF size:", output.stat().st_size, "bytes")
