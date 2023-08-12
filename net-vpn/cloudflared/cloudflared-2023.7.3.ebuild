EAPI=8

inherit go-module
DESCRIPTION="Cloudflare Tunnel client (formerly Argo Tunnel)"
HOMEPAGE="https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide"
SRC_URI="https://github.com/cloudflare/cloudflared/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="APACHE-2.0"
SLOT=0

BDEPEND="dev-lang/go"

src_configure() {
    tar xvf ${FILESDIR}/cloudflared-2023.7.3-vendor.tar.gz
}

src_compile() {
    ego build
}

src_install() {
    dobin cloudflared

    default
}