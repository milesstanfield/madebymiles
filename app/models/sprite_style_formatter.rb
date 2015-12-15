class SpriteStyleFormatter
  attr_reader :options

  def initialize(options)
    @options = options
  end

  def format(images)
    @images = images
    (sass_imports_header + individual_styles + group_styles)
  end

  private

  def sass_imports_header
    "@import 'variables';\n"
  end

  def position_x(style)
    background_positions(style)[0]
  end

  def position_y(style)
    background_positions(style)[1]
  end

  def background_positions(style)
    style.split(")) ")[1].split
  end

  def used_selectors
    @individual_styles.gsub("\n\n", "\n").split("\n").map {|line| line.split.first}.join(", ")
  end

  def image_style_excluded?(image_name)
    excluded_style_images.any? {|name| name == image_name.to_s}
  end

  def default_style(image_name, image_data, selector)
    selector = "" if selector == "div"
    "#{selector}.#{image_name} { #{indivdual_style(image_data)} }"
  end

  def indivdual_style(image_data)
    %{
      width: #{image_data[:width]}px;
      height: #{image_data[:height]}px;
      background-position: #{position_x(image_data[:style])} #{position_y(image_data[:style])};
    }.squish.gsub("\n", "")
  end

  def group_styles
    %{
      #{used_selectors} {
        background-repeat: no-repeat;
        background-image: #{options.sprites_rails_helper};
        @media only screen and (-webkit-min-device-pixel-ratio: 1.5), only screen and (-o-min-device-pixel-ratio: 3/2), only screen and (min--moz-device-pixel-ratio: 1.5), only screen and (min-device-pixel-ratio: 1.5) {
          background-image: #{options.retina_sprites_rails_helper};
          -webkit-background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT;
          -moz-background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT;
          -ms-background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT;
          -o-background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT;
          background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT;
        }
      }
    }
  end

  def excluded_style_images
    ["arrow_button_hovered"]
  end

  def individual_styles
    @individual_styles ||= begin
      @images.map do |image_name, image_data|
        unless image_style_excluded?(image_name)
          case image_name.to_s
          when "arrow_dark_blue"
            "div.arrow_dark_blue { #{indivdual_style(@images[:arrow_dark_blue])} }\n .a-circle-hover-blue:hover div.arrow_dark_blue { #{indivdual_style(@images[:arrow_blue])} }"
          else
            default_style(image_name, image_data, "div")
          end
        end
      end.join("\n").gsub("\n\n", "\n")
    end
  end
end
