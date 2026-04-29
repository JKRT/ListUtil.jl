[![CI](https://github.com/JKRT/ListUtil.jl/actions/workflows/ci.yml/badge.svg)](https://github.com/JKRT/ListUtil.jl/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/JKRT/ListUtil.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/JKRT/ListUtil.jl)
[![License: OSMC-PL](https://img.shields.io/badge/license-OSMC--PL-lightgrey.svg)](LICENSE.md)

# ListUtil.jl

List utility helpers for the Julia port of the OpenModelica compiler.
A Julia translation of the MetaModelica `ListUtil` module: `map`, `fold`,
`filter`, `filterOnTrue`, `position`, `flatten`, and more
operations on the immutable cons-list type `List{T}` provided by
[`MetaModelica.jl`](https://github.com/JKRT/MetaModelica.jl) and
[`ImmutableList.jl`](https://github.com/JKRT/ImmutableList.jl).

This package is part of the [OM.jl](https://github.com/JKRT/OM.jl) suite.

## Installation

ListUtil.jl is registered in the
[OpenModelicaRegistry](https://github.com/OpenModelica/OpenModelicaRegistry).
Add it from a Julia REPL:

```julia
import Pkg
Pkg.Registry.add(Pkg.RegistrySpec(url = "https://github.com/OpenModelica/OpenModelicaRegistry.git"))
Pkg.add("ListUtil")
```

## Usage

```julia
using ListUtil
using MetaModelica

lst = list(1, 2, 3, 4)

ListUtil.map(lst, x -> x + 1)            # list(2, 3, 4, 5)
ListUtil.fold(lst, (x, acc) -> x + acc, 0) # 10
ListUtil.filterOnTrue(lst, iseven)        # list(2, 4)
```

## License

Distributed under the OSMC Public License (OSMC-PL) v1.8 or GNU AGPL v3, at
the recipient's choice. See [LICENSE.md](LICENSE.md) for the full text.
