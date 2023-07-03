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
src_unpack() {
    mkdir -p ${S}
    ls ${DISTDIR}/
    cp ${DISTDIR}/xenia_splash.png ${S}
    cp ${DISTDIR}/xenia_cpu.png ${S}
}

src_prepare() {
    default
}

src_compile() {
    convert xenia_splash.png -type truecolor xenia_splash.bmp
    convert xenia_cpu.png -resize 80x80 xenia_cpu.png
	pngtopnm xenia_cpu.png | ppmquant 224 | pnmtoplainpnm > xenia_cpu.ppm
}

src_install() {
    install -d "${D}/etc/splash"
    install xenia_cpu.ppm "${D}/etc/splash"
    install xenia_splash.bmp "${D}/etc/splash"
}
