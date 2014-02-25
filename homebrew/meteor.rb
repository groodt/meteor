require 'formula'

class Meteor < Formula
  homepage 'http://www.meteor.com'
  url 'http://d3sqy0vbqsdhku.cloudfront.net/meteor-package-Darwin-x86_64-0.3.6.tar.gz'
  sha256 'daea5fcffb5ea927d4cf498606d67e87402f2debab30bb8d45b2e6914aef62c3'

  def startup_script
    <<-EOS
#!/bin/bash
exec "#{libexec}/bin/meteor" "$@"
EOS
  end

  def install
    libexec.install Dir['*']
    (libexec+'meteor').write startup_script
    (libexec+'meteor').chmod 0755
    bin.install_symlink libexec+'meteor'
  end
end
