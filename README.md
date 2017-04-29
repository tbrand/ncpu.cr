# ncpu

This library returns number of cpus(cores).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  ncpu:
    github: tbrand/ncpu
```

## Usage

```crystal
require "ncpu"
```

To get number of cores, you do
```crystal
num_of_cpu_cores = Ncpu.get
```

## Contributing

1. Fork it ( https://github.com/tbrand/ncpu/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [tbrand](https://github.com/tbrand) taicsuzu - creator, maintainer
