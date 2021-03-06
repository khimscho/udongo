# If you want to use this concern, you need to add an integer field 'parent_id'
# to the model.
module Concerns
  module Parentable
    extend ActiveSupport::Concern

    included do
      has_many :children, class_name: self.name, foreign_key: :parent_id, dependent: :destroy
      belongs_to :parent, class_name: self.name
    end

    def depth
      parent.nil? ? 0 : 1 + parent.depth
    end

    def parentable?
      true
    end

    def parents(instance: nil, list: [], include_self: true)
      instance = self unless instance.present?
      list << instance if include_self
      instance.parent ? parents(instance: instance.parent, list: list) : list
    end

    module ClassMethods
      def flat_tree(parent_id: nil, list: [])
        children = name.constantize.where(parent_id: parent_id)

        children.each do |c|
          list << c
          list = self.flat_tree(parent_id: c.id, list: list) if c.children.any?
        end

        list
      end
    end
  end
end
