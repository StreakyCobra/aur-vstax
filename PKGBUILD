# Maintainer Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="vstax"
_year="2019"
pkgver="${_year}_1.0.10"
pkgrel="277"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('i686' 'x86_64')
depends=('java-runtime=8' 'shared-mime-info' 'desktop-file-utils')
install="vstax.install"
changelog="ChangeLog"
[ "${CARCH}" = "i686" ] && _CARCH='i386'
[ "${CARCH}" = "x86_64" ] && _CARCH='amd64'
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${pkgver}-${pkgrel}_${_CARCH}.deb"
        'archlinux.patch')
sha256sums=('c1430720b16220b6035ee0505e728b9e84ff3a637fac8b74b318a19fb4126c12'
            'c6109f2b3768a0f6920f98fd6ccf0b3c7b9ffe701c404ca24536b3344cc900f9')

[ "${CARCH}" = "x86_64" ] && sha256sums[0]='b721c74a21552ef348e586be12bcd6b29ae295f26a592363bbcf6f0da1d30447'

prepare() {
    cd "${srcdir}/"

    # Extract the data contained in the `deb` file
    tar -xf data.tar.xz

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

