class Wine < ActiveRecord::Base
  has_many :log_entries, dependent: :destroy
  VARIETALS = ['Albariño', 'Aligoté', 'Amarone', 'Arneis', 'Asti Spumante', 'Auslese', 'Banylus', 'Barbaresco', 'Bardolino', 'Barolo', 'Beaujolais', 'Blanc de Blancs', 'Blanc de Noirs', 'Blush', 'Boal', 'Brunello', 'Cabernet Franc', 'Cabernet Sauvignon', 'Carignan', 'Carmenere', 'Cava', 'Charbono', 'Champagne', 'Chardonnay', 'Châteauneuf-du-Pape', 'Chenin Blanc', 'Chianti', 'Chianti Classico', 'Claret', 'Colombard', 'Constantia', 'Cortese', 'Dolcetto', 'Eiswein', 'Frascati', 'Fumé Blanc', 'Gamay', 'Gamay Beaujolais', 'Gattinara', 'Gewürztraminer', 'Grappa', 'Grenache', 'Johannisberg Riesling', 'Kir', 'Lambrusco', 'Liebfraumilch', 'Madeira', 'Malbec', 'Marc', 'Marsala', 'Marsanne', 'Mead', 'Meritage', 'Merlot', 'Montepulciano', 'Moscato', 'Mourvedre', 'Müller-Thurgau', 'Muscat', 'Nebbiolo', 'Petit Verdot', 'Petite Sirah', 'Pinot Blanc', 'Pinot Grigio/Pinot Gris', 'Pinot Meunier', 'Pinot Noir', 'Pinotage', 'Port', 'Retsina', 'Rosé', 'Roussane', 'Sangiovese', 'Sauterns', 'Sauvignon Blanc', 'Sémillon', 'Sherry', 'Soave', 'Tokay', 'Traminer', 'Trebbiano', 'Ugni Blanc', 'Valpolicella', 'Verdicchio', 'Viognier', 'Zinfandel']
  COUNTRIES = ['Algeria', 'Argentina', 'Australia', 'Austria', 'Belarus', 'Brazil', 'Bulgaria', 'Canada', 'Chile', 'China', 'Croatia', 'Czech Republic', 'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Italy', 'Japan', 'Macedonia', 'Mexico', 'Moldova', 'Morocco', 'New Zealand', 'Peru', 'Portugal', 'Romania', 'Russia', 'Serbia', 'Slovakia', 'Slovenia', 'South Africa', 'Spain', 'Switzerland', 'Tunisia', 'Turkey', 'Ukraine', 'United States', 'Uruguay', 'Uzbekistan']
  validates :name, :year, :country, presence: true
  validates :year, numericality: { only_integer: true, greater_than_or_equal_to: 1900}, if: "year.present?"
  validates :country, inclusion: { in: COUNTRIES, message: "%{value} is not recognized" }
  validates :varietal, inclusion: { in: VARIETALS, message: "%{value} is not recognized" }

  def average_rating
    if log_entries.loaded?
      log_entries.map(&:rating).compact.average
    else
      log_entries.average(:rating)
    end
  end
end
