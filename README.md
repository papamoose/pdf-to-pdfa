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
