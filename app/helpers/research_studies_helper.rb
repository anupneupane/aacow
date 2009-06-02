module ResearchStudiesHelper
  
  def options
    r = ['General_Allergy_Studies_Question']
    r += ResearchStudy.all.collect{ |r| r.title }
  end
  
  def to
    "jhblacklock@gmail.com"
    #"acw.cjenkins@gmail.com."
  end
  
end
