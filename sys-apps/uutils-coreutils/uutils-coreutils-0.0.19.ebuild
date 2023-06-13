# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.6.2

EAPI=8

CRATES="
	Inflector-0.11.4
	adler-1.0.2
	ahash-0.7.6
	aho-corasick-0.7.19
	aho-corasick-1.0.1
	aliasable-0.1.3
	android-tzdata-0.1.1
	android_system_properties-0.1.5
	anstream-0.3.2
	anstyle-1.0.0
	anstyle-parse-0.2.0
	anstyle-query-1.0.0
	anstyle-wincon-1.0.1
	arrayref-0.3.6
	arrayvec-0.7.2
	autocfg-1.1.0
	bigdecimal-0.3.0
	binary-heap-plus-0.5.0
	bindgen-0.63.0
	bitflags-1.3.2
	blake2b_simd-1.0.1
	blake3-1.3.3
	block-buffer-0.10.3
	bstr-1.5.0
	bumpalo-3.11.1
	bytecount-0.6.3
	byteorder-1.4.3
	cc-1.0.77
	cexpr-0.6.0
	cfg-if-1.0.0
	chrono-0.4.26
	clang-sys-1.4.0
	clap-4.3.0
	clap_builder-4.3.0
	clap_complete-4.3.0
	clap_lex-0.5.0
	clap_mangen-0.2.9
	codespan-reporting-0.11.1
	colorchoice-1.0.0
	compare-0.1.0
	console-0.15.7
	constant_time_eq-0.2.4
	conv-0.3.3
	core-foundation-sys-0.8.3
	coz-0.1.3
	cpp-0.5.7
	cpp_build-0.5.7
	cpp_common-0.5.7
	cpp_macros-0.5.7
	cpufeatures-0.2.5
	crc32fast-1.3.2
	crossbeam-channel-0.5.8
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.14
	crossbeam-utils-0.8.15
	crossterm-0.26.1
	crossterm_winapi-0.9.0
	crunchy-0.2.2
	crypto-common-0.1.6
	ctor-0.1.26
	ctrlc-3.4.0
	custom_derive-0.1.7
	cxx-1.0.82
	cxx-build-1.0.82
	cxxbridge-flags-1.0.82
	cxxbridge-macro-1.0.82
	data-encoding-2.4.0
	data-encoding-macro-0.1.13
	data-encoding-macro-internal-0.1.11
	diff-0.1.13
	digest-0.10.7
	dlv-list-0.3.0
	dns-lookup-2.0.2
	dunce-1.0.4
	either-1.8.0
	encode_unicode-0.3.6
	env_logger-0.8.4
	errno-0.3.0
	errno-dragonfly-0.1.2
	exacl-0.10.0
	fastrand-1.8.0
	file_diff-1.0.0
	filetime-0.2.20
	flate2-1.0.24
	fnv-1.0.7
	fs_extra-1.3.0
	fsevent-sys-4.1.0
	fts-sys-0.2.4
	fundu-0.5.1
	futures-0.3.25
	futures-channel-0.3.25
	futures-core-0.3.25
	futures-executor-0.3.25
	futures-io-0.3.25
	futures-macro-0.3.25
	futures-sink-0.3.25
	futures-task-0.3.25
	futures-timer-3.0.2
	futures-util-0.3.25
	gcd-2.3.0
	generic-array-0.14.6
	getrandom-0.2.8
	glob-0.3.1
	half-2.2.1
	hashbrown-0.12.3
	hermit-abi-0.1.19
	hermit-abi-0.3.1
	hex-0.4.3
	hex-literal-0.4.1
	hostname-0.3.1
	humantime_to_duration-0.2.1
	iana-time-zone-0.1.53
	iana-time-zone-haiku-0.1.1
	indicatif-0.17.3
	inotify-0.9.6
	inotify-sys-0.1.5
	instant-0.1.12
	io-lifetimes-1.0.11
	is-terminal-0.4.7
	itertools-0.10.5
	itoa-1.0.4
	js-sys-0.3.60
	keccak-0.1.4
	kqueue-1.0.7
	kqueue-sys-1.0.3
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.144
	libloading-0.7.4
	link-cplusplus-1.0.7
	linux-raw-sys-0.1.4
	linux-raw-sys-0.3.0
	lock_api-0.4.9
	log-0.4.17
	lscolors-0.14.0
	match_cfg-0.1.0
	md-5-0.10.5
	memchr-2.5.0
	memmap2-0.6.0
	memoffset-0.8.0
	minimal-lexical-0.2.1
	miniz_oxide-0.5.4
	mio-0.8.6
	nix-0.26.2
	nom-7.1.3
	notify-6.0.0
	nu-ansi-term-0.47.0
	num-bigint-0.4.3
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.14.0
	num_threads-0.1.6
	number_prefix-0.4.0
	once_cell-1.17.2
	onig-6.4.0
	onig_sys-69.8.1
	ordered-multimap-0.4.3
	os_display-0.1.3
	ouroboros-0.15.6
	ouroboros_macro-0.15.6
	output_vt100-0.1.3
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	peeking_take_while-0.1.2
	phf-0.11.1
	phf_codegen-0.11.1
	phf_generator-0.11.1
	phf_shared-0.11.1
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.26
	platform-info-2.0.1
	portable-atomic-0.3.15
	ppv-lite86-0.2.17
	pretty_assertions-1.3.0
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.47
	procfs-0.15.1
	quick-error-2.0.1
	quickcheck-1.0.3
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	rand_pcg-0.3.1
	rayon-1.7.0
	rayon-core-1.11.0
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	reference-counted-singleton-0.1.2
	regex-1.8.3
	regex-automata-0.1.10
	regex-syntax-0.7.2
	rlimit-0.9.1
	roff-0.2.1
	rstest-0.17.0
	rstest_macros-0.17.0
	rust-ini-0.18.0
	rustc-hash-1.1.0
	rustc_version-0.4.0
	rustix-0.36.14
	rustix-0.37.7
	same-file-1.0.6
	scopeguard-1.1.0
	scratch-1.0.2
	selinux-0.4.0
	selinux-sys-0.6.2
	semver-1.0.14
	serde-1.0.147
	sha1-0.10.5
	sha2-0.10.6
	sha3-0.10.8
	shlex-1.1.0
	signal-hook-0.3.15
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	slab-0.4.7
	sm3-0.4.2
	smallvec-1.10.0
	smawk-0.3.1
	socket2-0.5.3
	static_assertions-1.1.0
	strsim-0.10.0
	subtle-2.4.1
	syn-1.0.103
	tempfile-3.5.0
	term_grid-0.1.7
	termcolor-1.1.3
	terminal_size-0.2.6
	textwrap-0.16.0
	thiserror-1.0.37
	thiserror-impl-1.0.37
	time-0.3.20
	time-core-0.1.0
	time-macros-0.2.8
	typenum-1.15.0
	unicode-ident-1.0.5
	unicode-linebreak-0.1.4
	unicode-segmentation-1.10.1
	unicode-width-0.1.10
	unicode-xid-0.2.4
	unindent-0.2.1
	users-0.11.0
	utf8parse-0.2.1
	uuid-1.2.2
	version_check-0.9.4
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	which-4.3.0
	wild-2.1.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	xattr-1.0.0
	yansi-0.5.1
	z85-3.0.5
	zip-0.6.6
"

inherit cargo

DESCRIPTION="GNU coreutils rewritten in Rust"
HOMEPAGE="https://uutils.github.io/user/"

if [[ ${PV} == 9999 ]] ; then
	EGIT_REPO_URI="https://github.com/uutils/coreutils"
	inherit git-r3
else
	SRC_URI="https://github.com/uutils/coreutils/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+="
		$(cargo_crate_uris)
	"
	S="${WORKDIR}"/coreutils-${PV}

	KEYWORDS="~amd64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD ISC MIT Unicode-DFS-2016
	|| ( Artistic-2 CC0-1.0 )
	|| ( CC0-1.0 MIT-0 )
"
SLOT="0"
IUSE="debug selinux coreutils test"
# TODO: Need to skip known-failing tests
RESTRICT="!test? ( test ) test"

DEPEND="
	dev-libs/oniguruma:=
	selinux? ( sys-libs/libselinux )
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=virtual/rust-1.64.0
	test? ( dev-util/cargo-nextest )
"

QA_FLAGS_IGNORED=".*"

src_unpack() {
	if [[ ${PV} == 9999 ]] ; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	makeargs=(
		# Disable output synchronisation as make calls cargo
		-Onone

		V=1

		PROFILE=$(usex debug debug release)

		PREFIX="${EPREFIX}/usr"
		MULTICALL=y
		MANDIR="/share/man/man1"

		SELINUX_ENABLED=$(usex selinux)
	)

    if use coreutils ; then
        makeargs+=(PROG_PREFIX="uu-")
    fi

	emake "${makeargs[@]}"
}

src_test() {
	local -x RUST_BACKTRACE=full

	# TODO: skip these
	# (See also: https://github.com/uutils/coreutils/issues/4946)
	#"coreutils::test_util_name execution_phrase_double"
	#"coreutils::test_util_name execution_phrase_single"
	#"coreutils::tests test_install::test_install_dir_dot"

	# Nicer output for nextest vs test
	emake "${makeargs[@]}" \
		CARGOFLAGS="${CARGOFLAGS} $(usev !debug --release)" \
		TEST_NO_FAIL_FAST="--no-fail-fast" \
		nextest
}

src_install() {
	emake "${makeargs[@]}" DESTDIR="${D}" install
}