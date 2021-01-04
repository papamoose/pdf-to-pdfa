## Install
`install.sh` isn't all encompasing and only tested on linux. It should work on MacOS.

#### File structure after install:

```
$HOME/.local/share/pdf2pdfa
|- PDFA_def.ps
|- srgb.icc
$HOME/.local/bin
|- pdf2pdfa
```
Ensure your add `$HOME/.local/bin` to `$PATH`.

For example for a `bash` shell:
```
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bash_profile
```


## Dependencies

### 1. ghostscript
GhostScript does the actual conversion to PDF/A.

How to install it will depend on your OS. Below are a few examples.

#### Debian/Ubuntu:
```
apt-get install ghostscript
```

#### MacOS
[*Requires `homebrew`*](https://formulae.brew.sh/formula/ghostscript)
```
brew install ghostscript
````

### 2. Optional: Verapdf
[Install Documentation](https://docs.verapdf.org/install)

```
wget http://downloads.verapdf.org/rel/verapdf-installer.zip
unzip verapdf-installer.zip
cd verapdf-greenfield-<version-number>
./verapdf-install
```
This will bring up a GUI. I selected a location of `$HOME/.local/verapdf`
This installer was barely usable on Ubuntu 20.04. You can safely next,next,finish you way to success.

Once installed you will have the `verapdf` script in `$HOME/.local/verapdf/verapdf`

Make sure that is in your `$PATH`.

```
ln -s $HOME/.local/verapdf/verapdf $HOME/.local/bin/verapdf
```

#### Using verapdf to verify the conversion results
```
$ verapdf --format text <path/to/filename.PDFA.pdf>
PASS /path/to/filename.PDFA.pdf
```

## Notes:
- Shoutout to [Planetary Science Institute](https://sbn.psi.edu/pds/other_tools/pdf1a.html) [who seem to be doing the same thing](https://github.com/sbn-psi/data-provider-tools/tree/master/pdf2pdfa).
