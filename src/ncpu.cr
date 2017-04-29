require "./ncpu/*"

module Ncpu
  def self.get
    LibC.sysconf(LibC::SC_NPROCESSORS_ONLN)
  end
end
