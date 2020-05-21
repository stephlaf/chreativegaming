require "administrate/base_dashboard"

class GameDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # thumbnail_attachment: Field::HasOne,
    # thumbnail_attachment: Field::ActiveStorage,
    # thumbnail_blob: Field::ActiveStorage,
    thumbnail_blob: Field::HasOne,
    # thumbnail_blob: Field::BelongsTo,

    # banner_attachment: Field::HasOne,
    # banner_attachment: Field::ActiveStorage,
    # banner_blob: Field::ActiveStorage,
    banner_blob: Field::HasOne,
    # banner_blob: Field::BelongsTo,

    # game_file_attachment: Field::HasOne,
    # game_file_attachment: Field::ActiveStorage,
    # game_file_blob: Field::HasOne,
    
    reviews: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    thumbnail: Field::ActiveStorage.with_options(show_preview_size: [100, 100]),
    banner: Field::ActiveStorage.with_options(show_preview_size: [500, nil]),
    description: Field::Text,
    category: Field::String,
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
  # thumbnail_attachment
  # thumbnail_blob
  # banner_attachment
  COLLECTION_ATTRIBUTES = %i[
  name
  reviews
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  
  # thumbnail_attachment
  # banner_attachment
  # game_file_attachment
  # game_file_blob

  # thumbnail_blob
  # banner_blob
  
  # reviews

  SHOW_PAGE_ATTRIBUTES = %i[
  name
  thumbnail
  banner
  id
  description
  category
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
  # thumbnail_attachment
  # thumbnail_blob
  # banner_attachment
  # banner_blob
  # game_file_attachment
  # game_file_blob
  FORM_ATTRIBUTES = %i[
  name
  description
  category
  thumbnail
  banner
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
    "Game #{game.name}"
  end
end
