require "administrate/base_dashboard"

class GameDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    thumbnail_blob: Field::HasOne,
    carousel_visuals_blob: Field::HasMany,
    reviews: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    thumbnail: Field::ActiveStorage.with_options(show_preview_size: [100, 100]),
    carousel_visuals: Field::ActiveStorage.with_options(show_preview_size: [100, 100]),
    description: Field::Text,
    category: Field::String,
    available_platforms: MultipleSelectField.with_options(collection: Game::PLATFORMS),
    download_link: Field::String,
    price_cents: Field::Number,
    status: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    available: Field::Boolean,
    price_bronze_cents: Field::Number,
    price_silver_cents: Field::Number,
    price_gold_cents: Field::Number,
    price_platinum_cents: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.

  COLLECTION_ATTRIBUTES = %i[
  name
  reviews
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.

  SHOW_PAGE_ATTRIBUTES = %i[
  name
  thumbnail
  carousel_visuals
  download_link
  id
  description
  category
  available_platforms
  price_cents
  status
  created_at
  updated_at
  available
  price_bronze_cents
  price_silver_cents
  price_gold_cents
  price_platinum_cents
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  name
  description
  category
  available_platforms
  thumbnail
  carousel_visuals
  download_link
  status
  available
  price_cents
  price_bronze_cents
  price_silver_cents
  price_gold_cents
  price_platinum_cents
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {

  }.freeze

  # Overwrite this method to customize how games are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(game)
    game.name
  end

  # permitted for has_many_attached
  def permitted_attributes
    super + [:carousel_visuals => []]
  end
end
