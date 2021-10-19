# frozen_string_literal: true

module TodosHelper
  def due_in_less_than_class(todo)
    base = 'due-in-less-than'
    if todo.due_at < 1.hour.from_now
      "#{base}-an-hour"
    elsif todo.due_at < 2.hours.from_now
      "#{base}-two-hours"
    elsif todo.due_at < 4.hours.from_now
      "#{base}-four-hours"
    else
      ''
    end
  end

  def overdue_ago_class(todo)
    'overdue-less-than-one-hour-ago'
  end

  def linkize(text)
    output = text

    text.scan(URI::DEFAULT_PARSER.make_regexp) do |_matches|
      output = output.sub $&, "<a target=\"_blank\" href=\"#{$&}\">#{$&}</a>"
    end

    output
  end

  def iconize(text)
    output = text

    text.scan(/>#{URI::DEFAULT_PARSER.make_regexp}</) do |matches|
      if matches[3].include? 'github'
        output = output.sub $&, "><i class=\"fab fa-github\"></i><"
      elsif matches[3].include? 'slack'
        output = output.sub $&, "><i class=\"fab fa-slack\"></i><"
      end
    end

    output
  end
end
