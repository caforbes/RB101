def get_grade(score_1, score_2, score_3)
  grades = [score_1, score_2, score_3]
  mean_score = grades.sum / grades.size

  letter_grade(mean_score)
end

def get_grade_2(*scores)
  mean_score = scores.sum / scores.size
  letter_grade(mean_score)
end

def letter_grade(numeric_grade)
    case numeric_grade
    when 90..100 then 'A'
    when 80...90 then 'B'
    when 70...80 then 'C'
    when 60...70 then 'D'
    else 'F'
    end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade_2(50, 50, 95, 100, 20)

=begin
PROBLEM:
  INPUT: 3 Integers
  OUTPUT: 1 String (letter grade)
  RULES? (explicit/implicit)
    - correspondence chart of grades to letters
    - three scores should be averaged (mean)
    - return the corresponding letter score
    - all input integers between 0-100 (no validation required)
  QUESTIONS: (input types? new/old object? empty input?)
    - can we change it to any number of input scores?

EXAMPLES (manually check them):

DATA STRUCTURES:
  grades = Integer
  letter grades = String
  conversion should be its own method or a constant somehow?

ALGORITHM (review the hardest example out loud):
  add all scores to an array
  sum the scores and divide by array size to get mean
  get letter value of mean score
    90 <= score <= 100  'A'
    80 <= score < 90  'B'
    70 <= score < 80  'C'
    60 <= score < 70  'D'
    0 <= score < 60 'F'
  return it

CODE!
=end
