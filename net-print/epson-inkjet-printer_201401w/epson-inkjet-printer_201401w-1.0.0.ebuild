EAPI=8

inherit autotools rpm

_pkgname_filter=epson-inkjet-printer-filter
MY_P=${P/_/-}
MY_PN=${PN/_/-}

DESCRIPTION="Epson printer driver (L456, L455, L366, L365, L362, L360, L312, L310, L222, L220, L132, L130)"
HOMEPAGE="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/03/45/41/92e9c9254f0ee4230a069545ba27ec2858a2c457/${MY_P}-1lsb3.2.src.rpm"
LICENSE='LGPL AND Epson Licence Agreement'
SLOT=0
KEYWORDS="amd64 i686"

DEPEND="net-print/cups app-text/ghostscript-gpl"
RDEPEND="${DEPEND}"

src_unpack() {
    rpm_src_unpack ${A}
    mkdir -p ${S}
    mv epson-inkjet-* ${S}
}

src_configure() {
    cd epson-inkjet-printer-filter-1.0.0
    patch -p1 -i ${FILESDIR}/1.0.0-fixbuild.patch
    eautoreconf -f -i
    ./configure LDFLAGS="${LDFLAGS} -Wl,--no-as-needed" --prefix=/opt/${MY_P}
    make
}

src_install() {
    cd "${S}/${MY_P}"
    install -d "${D}/opt/${P}/"
    if [ "$CARCH" = "x86_64" ]; then
        cp -a --no-preserve=mode lib64 "${D}/opt/${MY_P}"
    else
        cp -a --no-preserve=mode lib "${D}/opt/${MY_P}"
    fi
    cp -a --no-preserve=mode resource "${D}/opt/${MY_P}"

    if [ -e "watermark" ]; then
        cp -a --no-preserve=mode watermark "${D}/opt/${MY_P}"
    fi
    install -d "${D}/usr/share/cups/model/${MY_P}"
    install -m 644 ppds/* "${D}/usr/share/cups/model/${MY_P}"

    cd "${S}/${_pkgname_filter}-${PV}"
    install -d "${D}/opt/${MY_PN}/cups/lib/filter/"
    install -m 755 src/epson_inkjet_printer_filter "${D}/opt/${MY_PN}/cups/lib/filter/epson_inkjet_printer_filter"
}


