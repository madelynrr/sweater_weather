class MunchiesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :munchies_return
end
