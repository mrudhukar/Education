class MyFormBuilder < ActionView::Helpers::FormBuilder

  helpers = %w{text_field password_field text_area select date_select}

  helpers.each do |name|
    define_method(name) do |field_name, *args|
      options = args.extract_options!
      options[:class] ||= ''
      options[:class] << " #{name}"
      options[:title] ||= field_name.to_s.humanize

      if (name == "select")
        super_input = super(field_name, args[0], args[1] ||{}, options)
      elsif (name == "date_select")
        super_input = super(field_name, args[0] || {}, options)
      else
        super_input = super(field_name, options)
      end

      return super_input if options[:basic]

      super_input = make_inputs_inline(super_input) if (name == "date_select")

      title = get_title(object_name, field_name, options[:title], options.delete(:required)) unless options[:skip_title]
      help_text = get_help_text(options[:help_text])
      get_final_wrappings(super_input, title, help_text)
    end
  end

  def submit(label, *args)
    options = args.first || {}
    options[:disable_with] = 'please wait..'
    options[:class] = (options[:class] || '') + 'btn primary'

    super(label, options)
  end

  def cancel_path(label, *args)
    path = args[0]
    options = args.extract_options! || {}
    options[:disable_with] = 'please wait..'
    options[:class] = (options[:class] || '') + ' btn'

    @template.link_to(label, path, options)
  end

  def actions(&block)
    @template.content_tag(:div, @template.capture(&block), :class => "actions")
  end

  def inline_inputs(objects, *args)
    options = args.extract_options!
    title = get_title(nil, nil, options[:title], options.delete(:required)) unless options[:skip_title]
    help_text = get_help_text(options[:help_text])

    input = ""
    objects.each_with_index do |obj, i|
      if options[:prepend]
        pend = @template.content_tag(:span, options[:prepend][i], :class => "add-on")
        obj = @template.content_tag(:div, (pend + obj).html_safe, :class => "input-prepend")
      end
      input = (input+" "+obj).html_safe
    end
    super_input = make_inputs_inline(input.html_safe)
    get_final_wrappings(super_input, title, help_text)
  end

  private

  def get_title(object_name, field_name, text, required)
    field_id = "#{object_name}_#{field_name}"

    # Convert field ids of nested resources like user[professional_profile]_about_me
    # to user_professional_profile_about_me by replacing [ and ] with _
    #
    field_id.gsub!(/[\[\]]/, '_')
    field_id.gsub!(/_+/, '_')

    text << " *" if required

    return label(field_id, text.html_safe, :for => field_id)
  end

  def get_help_text(text)
    if text
      @template.content_tag(:span, text.html_safe, :class => "help-inline")
    else
      "".html_safe
    end
  end

  def make_inputs_inline(input)
    @template.content_tag(:div, input, :class => 'inline-inputs')
  end

  def get_final_wrappings(super_input, title, help_text)
    input = @template.content_tag(:div, super_input + help_text, :class => 'input')
    return @template.content_tag(:div, (title + input).html_safe, :class => 'clearfix')
  end

end