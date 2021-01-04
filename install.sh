#!/bin/bash

ghostscript_installed=$(which gs > /dev/null 2>&1; echo $?)

d="$HOME/.local/share/pdf2pdfa"
mkdir -p "${d}"

if [ $ghostscript_installed -eq 0 ]; then
  gsver=$(gs --version)

  if [ -f /usr/share/ghostscript/${gsver}/iccprofiles/srgb.icc ]; then
    cp /usr/share/ghostscript/${gsver}/iccprofiles/srgb.icc "${d}"/
  else
    cp ./lib/srgb.icc "${d}"/
  fi

cat << EOF > "${d}"/PDFA_def.ps
%!
% This is a sample prefix file for creating a PDF/A document.
% Feel free to modify entries marked with "Customize".
% This assumes an ICC profile to reside in the file (ISO Coated sb.icc),
% unless the user modifies the corresponding line below.

% Define entries in the document Info dictionary :
/ICCProfile (${d}/srgb.icc) % Customise
def

[ /Title (Title)       % Customise
  /DOCINFO pdfmark

% Define an ICC profile :

[/_objdef {icc_PDFA} /type /stream /OBJ pdfmark
[{icc_PDFA}
<<
  /N currentpagedevice /ProcessColorModel known {
    currentpagedevice /ProcessColorModel get dup /DeviceGray eq
    {pop 1} {
      /DeviceRGB eq
      {3}{4} ifelse
    } ifelse
  } {
    (ERROR, unable to determine ProcessColorModel) == flush
  } ifelse
>> /PUT pdfmark
[{icc_PDFA} ICCProfile (r) file /PUT pdfmark

% Define the output intent dictionary :

[/_objdef {OutputIntent_PDFA} /type /dict /OBJ pdfmark
[{OutputIntent_PDFA} <<
  /Type /OutputIntent             % Must be so (the standard requires).
  /S /GTS_PDFA1                   % Must be so (the standard requires).
  /DestOutputProfile {icc_PDFA}            % Must be so (see above).
  /OutputConditionIdentifier (srgb)      % Customize
>> /PUT pdfmark
[{Catalog} <</OutputIntents [ {OutputIntent_PDFA} ]>> /PUT pdfmark
EOF


  mkdir -p $HOME/.local/bin
  cp ./pdf2pdfa $HOME/.local/bin/pdf2pdfa
  chmod +x $HOME/.local/bin/pdf2pdfa

  export PATH=$HOME/.local/bin:$PATH

  echo 'Ensure you add $HOME/.local/bin to $PATH to whatever dot RC files you need to.'


else
  echo "Please install ghostscript before proceeding."
fi

