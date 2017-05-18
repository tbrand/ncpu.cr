require "./ncpu/*"

module Ncpu
  def self.get
    {% if flag?(:linux) || flag?(:darwin) %}  # or Solaris
       LibC.sysconf(LibC::SC_NPROCESSORS_ONLN)
    {% else %}
      {{ raise "Don't know how to count N CPUs on this machine." }}
    {% end %}
  end
end
