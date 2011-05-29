# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # Format _text_ including bbcode tags as html code.
  def bbcode_to_html(text)
    white_list(simple_format(auto_link(bbcodeize(h(text)))))
  end

  def display_standard_flashes(message = 'Es sind Fehler aufgetreten:')
    if flash[:notice]
      flash_to_display, level = flash[:notice], 'notice'
    elsif flash[:warning]
      flash_to_display, level = flash[:warning], 'warning'
    elsif flash[:error]
      level = 'error'
      if flash[:error].instance_of? ActiveRecord::Errors
        flash_to_display = message
        flash_to_display << activerecord_error_list(flash[:error])
      else
        flash_to_display = flash[:error]
      end
    else
      return
    end
    content_tag 'div', flash_to_display, :class => "flash #{level}"
  end

  def activerecord_error_list(errors)
    error_list = '<ul>'
    errors.each { |attr,msg| error_list << "<li>#{msg}</li>\n" }
    error_list << '</ul>'
  end
end
