module NamedNamedTuples
export @NamedNamedTuple

import NamedTupleTools
import ConstructionBase


macro NamedNamedTuple(Type)
    quote
      struct $(esc(Type)){T}
          x::T
      end

      Base.getproperty(nnt::$(esc(Type)), p::Symbol) = getproperty(getfield(nnt, :x), p)
      Base.propertynames(nnt::$(esc(Type))) = propertynames(getfield(nnt, :x))
      Base.NamedTuple(nnt::$(esc(Type))) = getfield(nnt, :x)
      Base.convert(::Type{NamedTuple}, nnt::$(esc(Type))) = getfield(nnt, :x)::NamedTuple
      Base.convert(::Type{$(esc(Type))}, nnt::NamedTuple) = $(esc(Type))(nnt)
      Base.merge(nnt::$(esc(Type)), fields::NamedTuple) = convert($(esc(Type)), merge(convert(NamedTuple, nnt), fields))
      Base.merge(fields::NamedTuple, nnt::$(esc(Type))) = convert($(esc(Type)), merge(fields, convert(NamedTuple, nnt)))

      NamedTupleTools.delete(nnt::$(esc(Type)), args...) = convert($(esc(Type)), NamedTupleTools.delete(convert(NamedTuple, nnt), args...))

      function ConstructionBase.setproperties(nnt::$(esc(Type)), patch::NamedTuple)
        $(esc(Type))(ConstructionBase.setproperties(getfield(nnt, :x), patch))
      end
  end
end


end
