lib LibC
  {% if flag?(:linux) %}
    {% if flag?(:x86_64) %}
      struct CpuSetT
        bits : Long[16]
      end
      fun sched_getaffinity(pid : LibC::PidT, cpusetsize: LibC::SizeT,
          mask : LibC::CpuSetT*) : LibC::Int
    {% end %}
    SC_NPROCESSORS_ONLN = 84
  {% elsif flag?(:darwin) || flag?(:freebsd) %}
    SC_NPROCESSORS_ONLN = 58
  {% end %}

  fun sysconf(name : LibC::Int) : LibC::Long
end
