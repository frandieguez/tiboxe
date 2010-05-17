class Translation < ActiveRecord::Base
  belongs_to  :concept

  public
  def self.find_fuzzy_translations_for(string_for_search, non_free = false)
    original_concepts_translations = Translation.find(:all, 
      :select => "DISTINCT (concept_id)",
      :conditions => [ "language = ? AND text LIKE ?", "en", "%#{string_for_search}%"] )

    if original_concepts_translations.count >0

      results = Array.new

      original_concepts_translations.each do |translations|

        concept = Concept.find_by_id(translations.concept_id)
        if (concept.is_free or non_free==true)

          original_translations = Translation.find(:all, :conditions => { :concept_id => translations.concept_id, :language => "en"}).map do |translation|
            translation.text
          end
          final_translations = Translation.find(:all, :order => "recommended DESC", :conditions => { :concept_id => translations.concept_id, :language => "gl"})

          results << [original_translations, concept, final_translations ]
        end
      end
      results
    else
      []
    end
  end
  
end
