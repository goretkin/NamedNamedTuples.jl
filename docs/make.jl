using NamedNamedTuples
using Documenter

makedocs(;
    modules=[NamedNamedTuples],
    authors="Gustavo Goretkin <gustavo.goretkin@gmail.com> and contributors",
    repo="https://github.com/goretkin/NamedNamedTuples.jl/blob/{commit}{path}#L{line}",
    sitename="NamedNamedTuples.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://goretkin.gitlab.io/NamedNamedTuples.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
