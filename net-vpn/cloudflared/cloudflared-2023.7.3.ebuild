EAPI=8

inherit go-module
DESCRIPTION="Cloudflare Tunnel client (formerly Argo Tunnel)"
HOMEPAGE="https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide"
SRC_URI="https://github.com/cloudflare/cloudflared/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="APACHE-2.0"
SLOT=0
KEYWORDS="amd64 i686"

BDEPEND="dev-lang/go"

src_configure() {
    default
    tar xvf ${FILESDIR}/${PN}-vendor.tar.gz
    mv ${PN}/vendor .
}

src_compile() {
    ego build
}

src_install() {
    dobin cloudflared

    default
}