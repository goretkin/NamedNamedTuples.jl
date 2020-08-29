# NamedNamedTuples

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://goretkin.github.io/NamedNamedTuples.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://goretkin.github.io/NamedNamedTuples.jl/dev)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://goretkin.gitlab.io/NamedNamedTuples.jl/dev)
[![Build Status](https://github.com/goretkin/NamedNamedTuples.jl/workflows/CI/badge.svg)](https://github.com/goretkin/NamedNamedTuples.jl/actions)
[![Build Status](https://github.com/goretkin/NamedNamedTuples.jl/badges/master/pipeline.svg)](https://github.com/goretkin/NamedNamedTuples.jl/pipelines)
[![Coverage](https://github.com/goretkin/NamedNamedTuples.jl/badges/master/coverage.svg)](https://github.com/goretkin/NamedNamedTuples.jl/commits/master)
[![Coverage](https://codecov.io/gh/goretkin/NamedNamedTuples.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/goretkin/NamedNamedTuples.jl)
[![Coverage](https://coveralls.io/repos/github/goretkin/NamedNamedTuples.jl/badge.svg?branch=master)](https://coveralls.io/github/goretkin/NamedNamedTuples.jl?branch=master)

In julia, `NamedTuple`s are sort of like anonymous `struct`s. Both `NamedTuple`s `struct`s have fields which are ordered, named, and typed.
A "named `NamedTuple`" is therefore like a "named anonymous struct", which is kind of like a struct! Writing a method for `NamedTuple`, unless the function makes sense generically across all `NamedTuple`s is probably a bad idea. This package gives a way to wrap the `NamedTuple` in a type so that you can dispatch on that type instead.

I have found this particularly useful until https://github.com/timholy/Revise.jl/issues/18 is closed.

Even if you know all the field of your type from the get-go, you might still be interested in `NamedNamedTuples` if you're dealing with values that only have entries for some of the fields of the type. Instead of using `nothing` to indicate a "missing" value, you can just leave it out of the named tuple. Perhaps this is an alternative to what Rich Hickey calls ["place-oriented programming (PLOP)"](https://www.youtube.com/watch?v=YR5WdGrpoug&t=21m00s). See the slide "Optionality and aggregates".
