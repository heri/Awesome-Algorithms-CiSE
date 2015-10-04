# recursive sorting with high-speed high space complexity approach

class Quicksort

  def quicksort(array)
    return [] if array.empty? || array.nil?
    pv = array.shift
    quicksort(array.select { |e| e < pv }) + [pv] + quicksort(array.select { |e| e >= pv })
  end

end
