lib LibC
  {% if flag?(:linux) %}
    SC_NPROCESSORS_ONLN = 84
  {% elsif flag?(:darwin) %}
    SC_NPROCESSORS_ONLN = 58
  {% end %}
  fun sysconf(name : LibC::Int) : LibC::Long
end
