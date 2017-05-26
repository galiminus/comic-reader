module ApplicationHelper
  def error_messages_for(*objects)
    options = objects.extract_options!
    options[:header_message] ||= t(:"errors.template.header", model: t(:"activerecord.models.#{objects.compact.first.class.name.downcase}"), count: objects.compact.first.errors.messages.size)
    options[:message] ||= t(:"errors.template.body")
    messages = objects.compact.map { |o| o.errors.full_messages }.flatten
    unless messages.empty?
      content_tag(:div, id: "error_explanation") do
        list_items = messages.map { |msg| content_tag(:li, msg) }
        content_tag(:h2, options[:header_message]) + content_tag(:p, options[:message]) + content_tag(:ul, list_items.join.html_safe)
      end
    end
  end

  def format_text(text)
    linked_text =
      auto_link(simple_format(h(text)), :html => { :target => '_blank', :rel => 'noopener', class: 'ellipsis' })
        .gsub("\n\n", '')
        .gsub("<p></p>", '')
        .gsub("<p>", "<p class='description'>")
        .html_safe
  end
end
