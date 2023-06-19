EAPI=8

inherit autotools verify-sig

GITURL="https://github.com/smuellerDD/${PN}"
URL="https://www.chronox.de"
DESCRIPTION="User space interface to the Linux Kernel Crypto API"
HOMEPAGE="https://www.chronox.de/${PN}.html"
SRC_URI="${URL}/${PN}/${PN}-${PV}.tar.xz
        verify-sig? ( ${URL}/${PN}/${PN}-${PV}.tar.xz.asc )"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~x86-linux"
SLOT="0"
LICENSE="BSD OR GPL-2.0-or-later" #I'm not sure how this is possible but it is

IUSE="systemd static fips coreutils hmac"

BDEPEND="
        dev-vcs/git
        sys-kernel/linux-headers
        dev-lang/perl
        systemd? (
            sys-apps/systemd
        )
        app-text/xmlto
"

src_unpack() {
	if use verify-sig ; then
		# Needed for downloaded patch (which is unsigned, which is fine)
		verify-sig_verify_detached "${DISTDIR}"/${P}.tar.xz{,.sig}
	fi

	default
}

src_prepare() {
	default
    eautoreconf -fiv
}

src_configure() {
    local myconf=(
        --disable-silent-rules \
        --enable-kcapi-encapp  \
        --enable-kcapi-dgstapp \
        --enable-kcapi-hasher  \
        --enable-kcapi-rngapp  \
        --enable-kcapi-speed   \
        --enable-kcapi-test    \
        --enable-shared        \
	)

    if use static ; then
        myconf+=(--enable-static)
    fi

   econf "${myconf[@]}"
}

src_install() {
	default
    find "${ED}" -name '*.la' -delete || die
    # cleanup based on present use flags
    if ! use fips ; then
        find "${ED}" -name 'fips*' -delete || die
    fi

    if ! use coreutils ; then
        find "${ED}" -name '*sum' -delete || die
    fi

    if ! use hmac ; then
        find "${ED}" -name '*hmac' -delete || die
    fi
}