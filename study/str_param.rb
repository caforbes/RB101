# def amethod(param)
#   id_1 = param.object_id

#   param += " universe"
#   id_2 = param.object_id

#   p id_1 == id_2

#   param << " world"
#   id_3 = param.object_id

#   p id_2 == id_3
# end

# str = "hello"
# amethod(str)

def bmethod(param)
  p "original param = #{param.object_id}"

  param += " universe"
  p "param after reassignment = #{param.object_id}"

  param << " world"
  p "param after concatenation = #{param.object_id}"
end

str = "hello"
p "original str = #{str.object_id}"

bmethod(str)

p "final str = #{str.object_id}"
