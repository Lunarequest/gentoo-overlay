EAPI=8

inherit go-module
DESCRIPTION="Cloudflare Tunnel client (formerly Argo Tunnel)"
HOMEPAGE="https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide"
SRC_URI="https://github.com/cloudflare/cloudflared/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Apache"
SLOT=0
KEYWORDS="amd64 i686"

BDEPEND="dev-lang/go"

src_configure() {
    default
    tar xf "${FILESDIR}/${P}-vendor.tar.gz"
    rm -rf vendor
    mv ${P}/vendor .
    mkdir build
}

src_compile() {
    go build -v \
    -buildmode=pie \
    -mod=vendor \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags ${LDFLAGS} \
      -X main.Version=${PV} \
      -X github.com/cloudflare/cloudflared/cmd/cloudflared/updater.BuiltForPackageManager=portage" \
    -o build \
    ./cmd/...

}

src_install() {
    default
    install -vDm755 -t "${D}/usr/bin" "build/${PN}"
    install -vDm644 -t "${D}/usr/share/man/man1" "build/${PN}.1"

}