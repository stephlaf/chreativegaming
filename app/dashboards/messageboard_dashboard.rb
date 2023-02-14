require "administrate/base_dashboard"

class Thredded::MessageboardDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.

  resource "Messageboards"

  ATTRIBUTE_TYPES = {
    categories: Field::HasMany,
    user_messageboard_preferences: Field::HasMany,
    posts: Field::HasMany,
    topics: Field::HasMany,
    last_topic: Field::BelongsTo.with_options(class_name: "Thredded::Topic"),
    user_details: Field::HasMany,
    messageboard_users: Field::HasMany,
    recently_active_user_details: Field::HasMany.with_options(class_name: "Thredded::UserDetail"),
    recently_active_users: Field::HasMany.with_options(class_name: "User"),
    user_topic_read_states: Field::HasMany.with_options(class_name: "Thredded::UserTopicReadState"),
    group: Field::BelongsTo.with_options(class_name: "Thredded::MessageboardGroup"),
    post_moderation_records: Field::HasMany,
    id: Field::Number,
    name: Field::Text,
    slug: Field::Text,
    description: Field::Text,
    topics_count: Field::Number,
    posts_count: Field::Number,
    position: Field::Number,
    last_topic_id: Field::Number,
    messageboard_group_id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    locked: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  categories
  user_messageboard_preferences
  posts
  topics
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  categories
  user_messageboard_preferences
  posts
  topics
  last_topic
  user_details
  messageboard_users
  recently_active_user_details
  recently_active_users
  user_topic_read_states
  group
  post_moderation_records
  id
  name
  slug
  description
  topics_count
  posts_count
  position
  last_topic_id
  messageboard_group_id
  created_at
  updated_at
  locked
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  categories
  user_messageboard_preferences
  posts
  topics
  last_topic
  user_details
  messageboard_users
  recently_active_user_details
  recently_active_users
  user_topic_read_states
  group
  post_moderation_records
  name
  slug
  description
  topics_count
  posts_count
  position
  last_topic_id
  messageboard_group_id
  locked
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

  # Overwrite this method to customize how messageboards are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(messageboard)
  #   "Thredded::Messageboard ##{messageboard.id}"
  # end
end
