
def main [
  --help (-h)
  --mode (-m): string
  --theme (-t): string
]
{
if $help {exit 0
}
if ($mode | is-empty )or($theme | is-empty ){| print -e
exit 1
}let cfg = $'($env HOME)/.config'$theme $mode $'($cfg )/kitty/themes''.conf'$theme $mode $'($cfg )/waybar/themes''.css'$theme $mode $'($cfg )/ghostty/themes'''}
def help []
{print $"Usage:\n  %s [options]\n "print $"Options: "print $"  -h, --help         Display this message "print $"  -m, --mode MODE    Specify either dark or light mode "print $"  -t, --theme THEME  Specify the name of the theme to use "}
def set [theme, mode, path, ext]
{rm -f
$'($path )/current ($ext )'cp -f
$'($path )/ ($theme )- ($mode )($ext )'$'($path )/current ($ext )'}
