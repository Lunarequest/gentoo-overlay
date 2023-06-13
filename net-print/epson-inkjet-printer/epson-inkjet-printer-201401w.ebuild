EAPI=8

inherit autotools

_pkgname_filter=epson-inkjet-printer-filter

DESCRIPTION="Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)"
HOMEPAGE="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/03/45/41/92e9c9254f0ee4230a069545ba27ec2858a2c457/${P}-1.0.0-1lsb3.2.src.rpm"
LICENSE='LGPL & Epson Licence Agreement'
SLOT=0
KEYWORDS="amd64 i686"

DEPEND="net-print/cups app-text/ghostscript-gpl"
RDEPEND="${DEPEND}"

PATCHES=(
    "${FILESDIR}/1.0.0-fixbuild.patch"
)

src_unpack() {
    rpm_src_unpack ${A}
	cd "${S}"
    tar xzf ${P}-${PV}.tar.gz
    FILTER_FILE=$(ls $_pkgname_filter*.tar.gz)
    tar xzf $FILTER_FILE
    eapply "${FILESDIR}/1.0.0-fixbuild.patch"
}

src_configure() {
	default
    eautoreconf -f -i
}

src_compile() {
    emake
}

src_install() {
    install -d "${D}/opt/${P}/"
    if [ "$CARCH" = "x86_64" ]; then
        cp -a --no-preserve=mode lib64 "${D}/opt/${P}"
    else
        cp -a --no-preserve=mode lib "${D}/opt/${P}"
    fi
    cp -a --no-preserve=mode resource "${D}/opt/${P}"

    if [ -e "watermark" ]; then
        cp -a --no-preserve=mode watermark "${D}/opt/${P}"
    fi
    install -d "${D}/usr/share/cups/model/${P}"
    install -m 644 ppds/* "${D}/usr/share/cups/model/${P}"

    cd "$srcdir"
    FILTER_FILE=`ls $_pkgname_filter*.tar.gz`
    cd "${FILTER_FILE%.tar.gz}"
    install -d "${D}/opt/${P}/cups/lib/filter/"
    install -m 755 src/epson_inkjet_printer_filter "${D}/opt/${P}/cups/lib/filter/epson_inkjet_printer_filter"
}


