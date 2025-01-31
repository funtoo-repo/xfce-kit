# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit xdg-utils

DESCRIPTION="Music Player Daemon (mpd) panel plugin"
HOMEPAGE="https://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
SRC_URI="https://archive.xfce.org/src/panel-plugins/${PN}/${PV%.*}/${P}.tar.bz2"

LICENSE="ISC"
SLOT="0"
KEYWORDS="*"
IUSE="+libmpd"

RDEPEND=">=xfce-base/libxfce4ui-4.12:=[gtk3(+)]
	>=xfce-base/xfce4-panel-4.13.5:=
	libmpd? ( media-libs/libmpd:= )"
DEPEND="${RDEPEND}
	dev-util/intltool
	virtual/pkgconfig"

src_configure() {
	econf $(use_enable libmpd)
}

src_install() {
	default
	find "${D}" -name '*.la' -delete || die
}

