# Collections and handling methods


## Flat collections


Collections are object classes where the object contains many sub-elements which can themselves be operated on. The main types of collections include Strings, Arrays, and Hashes. In Ruby, these three types are mutable. The String class includes the Comparable mixin, while Arrays and Hashes include the Enumerable mixin.


## Collection methods


We can perform many operations on sets of things. The most typical for Arrays and Hashes are **iteration**, **transformation**, and **filtering**. The three main Ruby methods to perform these operations are `each`, `map`, and `select`. All three of these methods take blocks, and pass their collection elements as arguments to the block, but have slight differences in their return values and how they interact with the block's return values.


`each` iterates over the elements collection without modifying them. It executes the block on each iteration. It returns the original collection.
[What does each return...?](@card/hIEIKwsUiPwtpMA)


`map` transforms the collection, returning a new collection where each element corresponds to the return value of the block. The block is executed on each iteration, with the consequence that the original array and the new returned array will be of the same length.
[What does map return...?](@card/pObSCp8Ve8oMxdK)


`select` filters the collection, returning a new collection containing only elements for which the block, when executed on that iteration, returned a truthy value. It returns an array the same size or smaller than the original, even an empty array.
[What does select return...?](@card/kTdIZCknDC0jFE8)


## Sorting collections


Collections are most typically sorted with `sort`, which references the comparison operator `<=>`, which is defined for a number of different classes.


Numbers are sorted by value; strings are sorted characterwise based on ASCII value; arrays are sorted element-wise based on the values they contain (and cannot be sorted if they contain incomparable element types).


[By default, how does the sort method order strings?](@card/8mGIlSJJeRUDvz5)
[How are Arrays compared with the ` operator? With sort`?](@card/VdWidTMDcCAOqrs)


## Nested collections


Arrays and Hashes can also contain any other class of object, including other arrays and hashes. This means they can be indefinitely nested, they are recursive structures.


The elements contained by Arrays and Hashes are still independent objects that can undergo mutation. Mutation of an element is not treated as mutation of the containing structure. Copying the containing structure does not produce copies of its elements, only copies of references to those elements; similarly, freezing the containing structure does not freeze those elements. **Shallow** operations only affect the container; there are very few built-in **deep** operations which also affect every sub-element.


[What does the freeze method do to an array? What are its limitations?](@card/cFR6qsfcHB83hPo)
[What will be returned by this code?](@card/B0vuAw3proGk0mq)
