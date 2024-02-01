require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    # avatar_attachment: Field::HasOne,
    # avatar_attachment: Field::ActiveStorage,
    # avatar_blob: Field::HasOne,
    avatar: Field::ActiveStorage.with_options(show_preview_size: [100, 100]),
    id: Field::Number,
    email: Field::String,
    encrypted_password: Field::String.with_options(searchable: false),
    password: Field::String.with_options(searchable: false),
    password_confirmation: Field::String.with_options(searchable: false),
    reset_password_token: Field::String.with_options(searchable: false),
    reset_password_sent_at: Field::DateTime.with_options(searchable: false),
    remember_created_at: Field::DateTime.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    gametag: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    status: Field::String,
    master: Field::Boolean,
    archived: Field::Boolean,
    deleted_at: Field::DateTime,
    gamer_type: Field::Enum,
    membership_level: Field::Select.with_options(collection: ['', 'Bronze', 'Silver', 'Gold', 'Platinum']),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  # avatar_attachment
  # avatar_blob
  COLLECTION_ATTRIBUTES = %i[
  id
  gametag
  membership_level
  gamer_type
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  # avatar_attachment
  # avatar_blob
  # encrypted_password
  # status
  # reset_password_token
  # reset_password_sent_at
  # remember_created_at

  SHOW_PAGE_ATTRIBUTES = %i[
  master
  id
  gametag
  avatar
  membership_level
  gamer_type
  email
  first_name
  last_name
  created_at
  updated_at
  deleted_at
  archived
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  # avatar_attachment
  # avatar_blob
  # reset_password_token
  # reset_password_sent_at
  # password_confirmation
  # encrypted_password
  # remember_created_at
  # archived
  # deleted_at
  # status

  FORM_ATTRIBUTES = %i[
  master
  gametag
  avatar
  email
  password
  first_name
  last_name
  membership_level
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
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    user.gametag
  end
end
