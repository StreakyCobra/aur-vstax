# Maintainer Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="vstax"
_year="2015"
pkgver="${_year}.1.0.8"
pkgrel="1"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('i686' 'x86_64')
depends=('java-runtime' 'shared-mime-info' 'desktop-file-utils')
install="vstax.install"
changelog="ChangeLog"
[ "${CARCH}" = "i686" ] && _CARCH='i386'
[ "${CARCH}" = "x86_64" ] && _CARCH='64'
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${_year}_${_CARCH}.deb"
        'archlinux.patch')
sha256sums=('982d17d19c57b62b3c1989099dcba5a248a9d332d70b8e8fe0bd416e58eedd68'
            'd45497f85f4c4f7b413ded1ff184df965a4154cd2e915d99c131ec236df2909d')
[ "${_CARCH}" = "64" ] && sha256sums[0]='9a7abf078d5c689aab73b38281476cbad62391c38b735d038fac28c51eac3850'

prepare() {
    cd "${srcdir}/"

    # Extract the data contained in the `deb` file
    tar -xzf data.tar.gz

    # Patch for archlinux
    patch -p2 < archlinux.patch
}

package() {
    cd "${srcdir}/usr/share/"

    # Store application name in a variable
    _appname="${pkgname}${_year}"

    # Copy the application descriptor
    install -D "applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Copy the application changelog
    install -D "doc/${_appname}/changelog.Debian.gz" "${pkgdir}/usr/share/doc/${_appname}/changelog.Debian.gz"

    # Copy the mime descriptor
    install -D "mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${_appname}.xml"

    # Copy the application itself
    install -d "${pkgdir}/usr/share/java/"
    cp -R "${_appname}" "${pkgdir}/usr/share/java/${_appname}"

    # Move executable to /usr/bin
    install -d "${pkgdir}/usr/bin/"
    mv "${pkgdir}/usr/share/java/${_appname}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    # Remove the included java environment
    rm -Rf "${pkgdir}/usr/share/java/${_appname}/jre"
}

# vim:set ts=4 sw=4 et:
