EAPI=8

S="${WORKDIR}/${P}"
DESCRIPTION="Wallpapers & various images used by luna"
HOMEPAGE="https://nullrequest.com"
SRC_URI="
    https://xenia-linux-site.glitch.me/images/cathodegaytube-splash.png -> xenia_splash.png
    https://xenia-linux-site.glitch.me/images/questfortori3.png -> xenia_cpu.png
"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
    media-gfx/imagemagick
    media-libs/netpbm
"
src_prepare() {
    mdkir -p ${S}
    cp xenia_splash.png ${S}
    cp xenia_cpu.png ${S}
}

src_compile() {
    convert xenia_splash.png -type truecolor xenia_splash.bmp
    pngtopnm xenia_cpu.png | ppmquant -fs223 | pnmtoplainpnm > xenia_cpu.ppm
}

src_install() {
    install -D "${D}/etc/splash"
    install xenia_cpu.ppm "${D}/etc/splash"
    install xenia_splash.bmp "${D}/etc/splash"
}
