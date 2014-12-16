module Navigator
  # Renders a HTML menu.
  class Menu
    def self.allowed_methods
      %r(^(section|h[1-6]|ul|li|a|b|em|s|small|span|strong|sub|sup)$)
    end

    def initialize template, tag: "ul", attributes: {}, activator: Navigator::TagActivator.new, &block
      @template = template
      @tag = Navigator::Tag.new tag, attributes: attributes, activator: activator
      @menu_activator = activator
      @items = []
      instance_eval(&block) if block_given?
    end

    def add name, content = nil, attributes: {}, activator: menu_activator, &block
      tag = Navigator::Tag.new name, content, attributes: attributes, activator: activator
      if block_given?
        items << tag.prefix
        items << tag.content
        instance_eval(&block)
        items << tag.suffix
      else
        items << tag.render
      end
    end

    def item content, url, item_attributes: {}, link_attributes: {}, activator: menu_activator
      link_attributes.reverse_merge! href: url

      if link_attributes[:href] == activator.search_value
        item_attributes[activator.target_key] = activator.target_value
      end

      add "li", attributes: item_attributes, activator: activator do
        add "a", content, attributes: link_attributes, activator: Navigator::TagActivator.new
      end
    end

    def respond_to? name
      method_allowed?(name) || super(name)
    end

    def method_missing name, *args, **keywords, &block
      if method_allowed?(name.to_s)
        add(name, *args, **keywords, &block)
      else
        template.public_send name, *args
      end
    end

    def render
      [tag.prefix, tag.content, items.compact.join(''), tag.suffix].compact * ''
    end

    private

    attr_accessor :template, :tag, :menu_activator, :items

    def method_allowed? name
      self.class.allowed_methods === name
    end
  end
end
