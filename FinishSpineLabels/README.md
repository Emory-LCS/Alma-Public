***finish_spine_process*** is a webservice that provides a form
to receive a text file with item barcodes and one or more email 
addresses. 
The webservice removes the two ALMA work orders linked to a given
barcode and it emails the results to the designated email address(es).
To remove a work order, the webservice invokes the SCAN API operation.
The result file is in spreadsheet format.
The barcodes correspond to items that received spine labels from SpineOMatic, 
the Windows library application.

### Files:
- finish_spine_labels.cfg
- finish_spine_labels.py
- finish_spine_labels.sh
- finish_spine_labels.html
- environ *

  (*) environ contains relevant unix environment variables to run the application as a CGI.
