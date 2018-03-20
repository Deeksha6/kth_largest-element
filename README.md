# kth_largest-element
PROLOG code to find the kth largest element in a list.
kth_largest(L,K,E) - kth largest element of list L is E

I have used merge sort to sort the list elements.

I have used the following predicates:
  reverse - to reverse the list
  append - to append elements to a list
  break - to break the list into smaller lists of 5 elements
  divide - to divide the list into 2 groups/lists
  element_pos - to get the position of an element in the list
  med_of_meds - to get the median of list of medians
  get_med - to get median of lists whose size is less than or equal to 5
  partition - to partition the list based on a pivot element(less than the pivot, greater than the pivot)
  
