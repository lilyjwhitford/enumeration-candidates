# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # loop over candidates to check if id matches the input id
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end
  # if there are no matches return nil
  return nil
end

# methods for qualified_candidates
  
def experienced?(candidate)
  if candidate[:years_of_experience] >= 2
    return true
  else
    return false
  end
end

def github_points_over_100?(candidate)
  if candidate[:github_points] >= 100
    return true
  else
    return false
  end
end

def knows_ruby_or_python?(candidate)
  if candidate[:languages].include("Ruby") || candidate[:languages].include("Python")
    return true
  else
    return false
  end
end

def applied_in_last_15_days?(candidate)
  if candidate[:date_applied] >= Date.today - 15
    return true
  else
    return false
  end
end

def over_17?(candidate)
  if candidate[:age] >= 17
    return true
  else
    return false
  end
end


def qualified_candidates(candidates)
  qualified = candidates.select do |candidate|
    experienced?(candidate) && github_points_over_100?(candidate) && knows_ruby_or_python?(candidate) && applied_in_last_15_days?(candidate) && over_17?(candidate)
  end
  qualified
end

def ordered_by_qualifications(candidates)
  # sort candidates by years of experience in descending order
 sorted_candidates = candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  
  # convert the array of arrays into a single array of hashes
 sorted_candidates.flatten(1)
end