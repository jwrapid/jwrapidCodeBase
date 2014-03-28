module ApplicationHelper
	# Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "e-Store"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def hidden_div_if(condition, attributes = {}, &block)
 		if condition
 			attributes["style"] = "display: none"
 		end
 		content_tag("div", attributes, &block)
	end

        def sortable(column, title = nil)
                title ||= column.titleize
                css_class = column == sort_column ? "current #{sort_direction} btn btn-primary product-btn" : "btn product-btn"
                direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
                link_to params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class} do                 
                if direction == "asc"
                   column == sort_column ? "<i class='icon-arrow-down icon-white'></i> #{title}".html_safe  : "#{title}"
                else
                   column == sort_column ? "<i class='icon-arrow-up icon-white'></i> #{title}".html_safe  : "#{title}"
                end

                end
        end
end
