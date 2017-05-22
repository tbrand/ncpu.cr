require "./ncpu/*"

module Ncpu
  def self.get
    {% if flag?(:linux) && flag?(:x86_64) %}
      set = uninitialized LibC::CpuSetT
      if LibC.sched_getaffinity(0, sizeof(LibC::CpuSetT), pointerof(set)) == 0
        ret : LibC::ULong = 0_u64
        ptr = (pointerof(set)).as(LibC::ULong*)
        asm("popcntq %rdi, %rax" : "={rax}"(ret) : "{rdi}"(ptr.value))
        return ret
      else
        LibC.sysconf(LibC::SC_NPROCESSORS_ONLN)
      end
    {% elsif flag?(:linux) || flag?(:darwin) || flag?(:freebsd) %}  # or Solaris
       LibC.sysconf(LibC::SC_NPROCESSORS_ONLN)
    {% else %}
      {{ raise "Don't know how to count N CPUs on this machine." }}
    {% end %}
  end
end
